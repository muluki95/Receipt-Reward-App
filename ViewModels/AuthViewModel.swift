//
//  AuthViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/8/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init() {
        Task{
            await fetchUserData()
        }
        
    }
    
    //function to login
    
    func login(withEmail email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUserData()
            
        } catch {
            
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid,fullname: fullname, email: email )
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUserData()
        } catch {
            print("Failed to create user with error: \(error.localizedDescription)")
        }
        
    }
    
    func logout() {
        do{
            try Auth.auth().signOut()  // signs out user on backend
            self.userSession = nil  // wipes out user session and takes us back to login screen
            self.currentUser = nil
            
        } catch {
            print("Cannot sign out user: \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUserData() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }  //if there is a current user it will fetch the rest else it will stop
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
    }
}

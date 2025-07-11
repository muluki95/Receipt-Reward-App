//
//  AuthViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/8/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init() {
        
    }
    
    //function to login
    
    func login(withEmail email: String, password: String) async throws{
        
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid,fullname: fullname, email: email )
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("Failed to create user with error: \(error.localizedDescription)")
        }
        
    }
    
    func logout() {
        
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUserData() async {
        
    }
}

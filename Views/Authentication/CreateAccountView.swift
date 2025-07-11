//
//  CreateAccountView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/5/25.
//

import SwiftUI


struct CreateAccountView: View {
    @State var email = ""
    @State var fullname = ""
    @State var password = ""
    @State var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body : some View {
        NavigationStack {
            VStack {
                
                Spacer()
                //form fields
                VStack(spacing: 24 ){
                    InputView(
                        text: $email,
                        title: "Email",
                        placeholder: "abc@gmail.com")
                    
                    InputView(
                        text: $fullname,
                        title: "Full Name",
                        placeholder: "Enter your name")
                    
                    InputView (
                        text: $password,
                        title: "Password",
                        placeholder: "Enter your password",
                        isSecureField: true
                        
                    )
                    ZStack(alignment: .trailing){
                        
                        InputView (
                            text: $confirmPassword,
                            title: " Confirm Password",
                            placeholder: "Confirm your password",
                            isSecureField: true
                        )
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword{
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                            }
                        }
                        
                    }
                }
                .padding()
                
                //create account  button
                Button(action:{
                    Task{
                        try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                    }
                }){
                    HStack{
                        Text("Create Account")
                            .fontWeight(.semibold)
                        Image(systemName: "chevron.right")
                    }
                }
                .frame(width: 280, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .disabled(formIsValid == false)
                .opacity(formIsValid == false ? 0.5 : 1)
                .cornerRadius(10)
                
                
                
                
                
                Spacer()
                Button  {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account")
                        Text("Log in ")
                            .fontWeight(.semibold)
                    }
                    .font(.system(size:14))
                }
                
            }
            
        }
    }
}
    
extension CreateAccountView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count >= 6 &&
        confirmPassword == password  &&
        !fullname.isEmpty
    }
}
   
#Preview {
    CreateAccountView()
        .environmentObject(AuthViewModel())
}

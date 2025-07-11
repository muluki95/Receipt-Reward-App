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
                    
                    InputView (
                        text: $confirmPassword,
                        title: " Confirm Password",
                        placeholder: "Confirm your password",
                        isSecureField: true
                     )
                     
                    
                }
                .padding()
                
                //login button
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
    
   
#Preview {
    CreateAccountView()
        .environmentObject(AuthViewModel())
}

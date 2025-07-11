//
//  LoginView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/4/25.
//

import SwiftUI


struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var email = ""
    @State var password = ""
   
   
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                //form fields
                VStack(spacing: 24 ){
                    InputView(
                        text: $email,
                        title: "Email",
                        placeholder: "abc@gmail.com")
                    
                    
                    
                    InputView (
                        text: $password,
                        title: "Password",
                        placeholder: "Enter your password",
                        isSecureField: true
                        
                    )
                    
                    
                    
                }
                .padding()
                
                //login button
                Button(action:{
                    Task{
                        try await viewModel.login(withEmail: email, password: password)
                        
                    }
                }){
                    HStack{
                        Text("Login")
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
                //create account button
                NavigationLink{
                    CreateAccountView()
                        .navigationBarBackButtonHidden(true)
                } label:{
                    HStack{
                        Text("Don't have an account?")
                        Text("Create one")
                            .fontWeight(.bold)
                    }
                    .font(.system(size:14))
                    
                }
                
            }
          
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count >= 6
    }
}
#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}

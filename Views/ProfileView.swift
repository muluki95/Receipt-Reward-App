//
//  ProfileView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
  
    
    var body: some View {
        if let user = viewModel.currentUser {
            List{
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .clipShape(Circle())
                        VStack(alignment:.leading, spacing: 5) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 5)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
                Section("General") {
                    HStack{
                        SettingsRowView(imageName:"gear", title: "Version", tintColor: Color(.systemGray))
                        
                        Spacer()
                        Text(" 1.3.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        
                    }
                }
                Section("Account"){
                    Button {
                        viewModel.logout()
                    } label: {
                        SettingsRowView(imageName:"person.circle.fill", title: "Logout", tintColor: Color(.systemRed))
                    }
                    Button {
                        print("Delete account")
                    } label: {
                        SettingsRowView(imageName:"xmark.circle.fill", title: "Delete Account", tintColor: Color(.systemRed))
                    }
                }
            }
        }
    }
}
#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}

//
//  InputView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/4/25.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .foregroundColor(.secondary.opacity(0.7))
                .fontWeight(.bold)
                .font(.caption)
                .font(.system(size: 15))
            
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 15))
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    
                   
                
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 15))
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    
                
            }
            Divider()
        }
        
    }
}

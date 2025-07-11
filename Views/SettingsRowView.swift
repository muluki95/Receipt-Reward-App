//
//  SettingsRowView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/8/25.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 8){
            Image(systemName: imageName)
                .font(.title)
                
                .foregroundColor(tintColor)
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title:" Version", tintColor: Color(.systemGray))
}

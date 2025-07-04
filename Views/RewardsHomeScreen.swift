//
//  RewardsScreenView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 5/31/25.
//

import Foundation
import SwiftUI

struct RewardsHomeScreen: View {
    
    var body: some View {
        VStack {
            Text("Welcome To Receipts Rewards")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)
                .foregroundColor(.blue)
            
            Image("HomeImage")
                .resizable()
                .scaledToFit()
                .frame(width:550, height: 400)
                .cornerRadius(20)
                .padding()
            
            Text("Scan Receipts, Earn Rewards")
                .font(.body)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
        }
    }
}

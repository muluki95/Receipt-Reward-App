//
//  RewardsRow.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/3/25.
//

import Foundation
import SwiftUI


struct RewardsRow: View {
    let reward: Rewards
    
    var body: some View {
            VStack(alignment:.leading, spacing: 4){
                Text("Title: \(reward.title)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                
                Text("Points: \(reward.pointsRequired)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                
            }
            
    }
}

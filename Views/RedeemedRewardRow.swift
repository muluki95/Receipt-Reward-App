//
//  RedeemedRewardRow.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import SwiftUI

struct RedeemedRewardRow: View {
    let redeemedreward: RedeemedReward
    
    var body: some View {
        VStack {
            Text("Title: \(redeemedreward.title)")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            Text("Image: \(redeemedreward.imageName)")
                .font(.caption)
                .padding()
            Text("Redeemed on \(dateFormatter.string(from: redeemedreward.dateRedeemed)) ")
                .font(.caption)
                .padding()
            Text("Used \(redeemedreward.pointsUsed) points")
                .font(.caption)
            
        }
        .padding()
    }
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}

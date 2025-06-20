//
//  RedeemedReward.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import Foundation

struct RedeemedReward: Identifiable, Codable {
    var id: String
    var title: String
    var imageName: String
    var dateRedeemed: Date
    var pointsUsed: Int
    
}

extension RedeemedReward {
    init(from receipt: ReceiptDetails) {
            self.id = UUID().uuidString
            self.title = "Reward from \(receipt.storeName)"
            self.imageName = "reward_icon" 
            self.dateRedeemed = receipt.dateScanned
            self.pointsUsed = receipt.pointsEarned
        }
}

//
//  RedeemedReward.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import Foundation

struct RedeemedReward: Identifiable, Codable, Hashable {
    var id: String
    var title: String
    var imageName: String
    var dateRedeemed: Date
    var pointsUsed: Int
    
}

extension RedeemedReward {
    init(from receipt: ReceiptDetails) {
        self.id = UUID().uuidString
        self.imageName = receipt.storeName
        
        switch receipt.storeName.lowercased() {
        case "starbucks":
            self.title = "$10 Starbucks Card"
            self.pointsUsed = 1000
            
        case "target":
            self.title = "$5 Target Coupon"
            self.pointsUsed = 500
            
        case "walmart":
            self.title = "$10 Walmart Voucher"
            self.pointsUsed = 1000
            
        default:
            self.title = "General Reward"
            self.pointsUsed = 750
        }
        
        self.dateRedeemed = Date()
    }
    
    }
    

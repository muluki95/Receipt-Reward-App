//
//  RedeemedRewardRepository.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/30/25.
//
import Foundation
import FirebaseFirestore


class RedeemedRewardRepository {
    private let db = Firestore.firestore()
    private let collection = "redeemedRewards"
    
    func save(reward: RedeemedReward) async throws {
        try db.collection(collection)
            .document(reward.id)
            .setData(from:reward)
        
        print("Redeemed reward saved successfully")
    }
}

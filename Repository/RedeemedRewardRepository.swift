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
    
    //fetch method
    func fetchRedeemedRewards() async throws -> [RedeemedReward]{
        let snapshot =  try await db.collection(collection).getDocuments()
        let redeemedRewards = snapshot.documents.compactMap { document in
            do{
                return try document.data(as: RedeemedReward.self)
            } catch {
                print("Failed to decode document: \(document.documentID), error: \(error)")
                return nil
            }
            
        }
       return redeemedRewards
    }
    
    //delete
    func deleteRedeemedReward(id: String) async throws {
        try await db.collection(collection).document(id).delete()
    }
}

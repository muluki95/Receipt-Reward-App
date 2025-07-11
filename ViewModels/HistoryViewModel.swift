//
//  HistoryViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/14/25.
//

import SwiftUI

@MainActor
class HistoryViewModel: ObservableObject {
    @Published var scannedReceipts: [ReceiptDetails] = []
    @Published var redeemedRewards: [RedeemedReward] = []
    
    private let repository = RedeemedRewardRepository()
    
    
    func addForm(receipt: ReceiptDetails) {
        scannedReceipts.append(receipt)
    
    
        
    }
    
    func saveRedeemedReward(receipt: ReceiptDetails) async {
        let reward = RedeemedReward(from: receipt)
        
        do {
            try await repository.save(reward: reward)
            redeemedRewards.append(reward)
            
            
        } catch {
            print("Failed to save reward: \(error.localizedDescription)")
        }
    }
    //fetch method
    
    func fetchRedeemedReward() async {
        
            do{
                self.redeemedRewards = try await repository.fetchRedeemedRewards()
                
            } catch {
                print(" Error fetching the receipts: \(error.localizedDescription)")
            
        }
    }
    
    //delete method
    
    func deleteRedeemedReward(_ reward: RedeemedReward) async {
            do{
                try await repository.deleteRedeemedReward(id: reward.id)
                redeemedRewards.removeAll{$0.id == reward.id}
                
            } catch {
                print("Failed to delete receipt: \(error.localizedDescription)")
            }
        }
}

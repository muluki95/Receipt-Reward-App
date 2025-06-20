//
//  HistoryViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/14/25.
//

import SwiftUI


class HistoryViewModel: ObservableObject {
    @Published var scannedReceipts: [ReceiptDetails] = []
    @Published var redeemedRewards: [RedeemedReward] = []
    
    
    func addForm(receipt: ReceiptDetails) {
        scannedReceipts.append(receipt)
        let reward = RedeemedReward(from: receipt)
        redeemedRewards.append(reward)
        
    }
}

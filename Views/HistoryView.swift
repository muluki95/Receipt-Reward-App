//
//  HistoryView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var historyViewModel: HistoryViewModel
    @ObservedObject var receiptViewModel: ReceiptViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                
                Text("Total scanned: \(historyViewModel.scannedReceipts.count)")
                    .foregroundColor(.gray)
                List {
                    if !historyViewModel.scannedReceipts.isEmpty {
                        Section(header: Text("Scanned Receipts")) {
                            ReceiptDetailsList(
                                receipt: historyViewModel.scannedReceipts,
                                viewModel: receiptViewModel,
                                onRedeem: { receipt in
                                    historyViewModel.redeemedRewards.append(
                                        RedeemedReward(from: receipt)
                                    )
                                    
                                    
                                    // removes from scanned receipts once redeemed
                                    if let index = historyViewModel.scannedReceipts.firstIndex(where: { $0.id == receipt.id }) {
                                        historyViewModel.scannedReceipts.remove(at: index)
                                        
                                    }
                                }
                            )
                        }
                    }
                    
                    if !historyViewModel.redeemedRewards.isEmpty {
                        Section(header : Text("Redeemed Rewards")){
                            RedeemedRewardList(redeemedrewards: historyViewModel.redeemedRewards)
                        }
                    }
                    
                }
                
                .navigationTitle("History")
            }
        }
    }
}

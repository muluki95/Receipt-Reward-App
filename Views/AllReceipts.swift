//
//  AllReceipts.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/2/25.
//

import SwiftUI


struct AllReceipts: View {
    @StateObject var viewModel: ReceiptViewModel
    
    var body: some View {
        NavigationStack {
            List{
                ForEach (viewModel.filteredReceipts) { receipt in
                    ReceiptDetailsRow(receipt: receipt, viewModel: viewModel)
                        .swipeActions {
                            Button(role: .destructive) {
                                Task {
                                    await viewModel.deleteReceipt(receipt: receipt)
                                }
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                        }
                   }
                }
                .searchable(text: $viewModel.searchText)
                .navigationTitle("Retrieved Receipts")
                .navigationBarTitleDisplayMode(.inline)
                .task {
                    await viewModel.fetchReceipts()
                }
            }
        }
    }


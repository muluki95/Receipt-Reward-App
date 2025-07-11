//
//  AllRedeemedRewards.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 7/4/25.
//


import SwiftUI


struct AllRedeemedRewards: View {
    @StateObject var viewModel: HistoryViewModel
    
    var body: some View {
        NavigationStack {
            List{
                ForEach (viewModel.redeemedRewards) { reward in
                    RedeemedRewardRow(redeemedreward: reward)
                        .swipeActions {
                            Button(role: .destructive) {
                                Task {
                                    await viewModel.deleteRedeemedReward(reward)
                                }
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                        }
                   }
                }
               
                .navigationTitle("Retrieved Rewards")
                .navigationBarTitleDisplayMode(.inline)
                .task {
                    await viewModel.fetchRedeemedReward()
                }
            }
        }
    }


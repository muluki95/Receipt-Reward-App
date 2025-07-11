//
//  MainTabView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 5/31/25.
//

import Foundation
import SwiftUI


struct MainTabView: View {
    @ObservedObject var historyViewModel: HistoryViewModel
    @ObservedObject var receiptViewModel: ReceiptViewModel
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            RewardsHomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ScanReceiptsView (historyViewModel: historyViewModel, selectedTab: $selectedTab)
                .tabItem {
                    Label("Scan", systemImage:"camera.fill")
                }
                        .tag(0)
            
            AllReceipts(viewModel: receiptViewModel)
                .tabItem {
                    Label("Receipts", systemImage:"note.text.badge.plus")
                }
                .tag(1)
            AllRedeemedRewards(viewModel: historyViewModel)
                .tabItem {
                    Label("Rewards", systemImage:"gift")
                }
                .tag(2)
                }
              
        }
    }


#Preview {
    MainTabView(historyViewModel: HistoryViewModel(),
    receiptViewModel: ReceiptViewModel(historyViewModel: HistoryViewModel()))
}

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
            HistoryView(historyViewModel: historyViewModel)
                .tabItem{
                    Label("History", systemImage:"clock.fill")
                }
                        .tag(1)
                        
                }
              
        }
    }


#Preview {
    MainTabView(historyViewModel: HistoryViewModel())
}

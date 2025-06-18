//
//  MainTabView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 5/31/25.
//

import Foundation
import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView{
            
            ScanReceiptsView ()
                .tabItem {
                    Label("Scan", systemImage: "camera.fill")
                }
            
            //RewardsScreenView ()
             //    .tabItem {
              //  Label("Rewards", systemImage:"giftcard.fill")
           // }
        }
    }
}

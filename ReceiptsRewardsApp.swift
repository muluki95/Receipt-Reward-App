//
//  ReceiptsRewardsApp.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/5/25.
//

import Foundation
import SwiftUI
import Firebase


@main

struct ReceiptsRewardsApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

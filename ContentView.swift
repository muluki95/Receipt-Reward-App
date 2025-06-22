//
//  ContentView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var historyViewModel = HistoryViewModel()
    var body: some View {
        MainTabView(historyViewModel: historyViewModel)
    }
}

#Preview {
    ContentView()
}

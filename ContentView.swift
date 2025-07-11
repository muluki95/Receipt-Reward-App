//
//  ContentView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var historyViewModel = HistoryViewModel()
    @StateObject var receiptViewModel = ReceiptViewModel(historyViewModel: HistoryViewModel())
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
              
                MainTabView(historyViewModel: historyViewModel, receiptViewModel: receiptViewModel )
            } else {
                CreateAccountView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}

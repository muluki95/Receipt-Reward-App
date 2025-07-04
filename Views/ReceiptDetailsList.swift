//
//  ReceiptDetailsList.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/12/25.
//

import Foundation
import SwiftUI


struct ReceiptDetailsList: View {
    let receipt: [ReceiptDetails]
    let viewModel: ReceiptViewModel
    var onRedeem: ((ReceiptDetails) -> Void)? = nil
    
    var body: some View {
        VStack{
            Text("ReceiptDetailsList")
            
            ForEach(receipt) { item in
                ReceiptDetailsRow(
                    receipt: item,
                    
                    onRedeem: {
                        onRedeem?(item)
                     },
                    viewModel: viewModel,
                    )
                
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Receipts")
    }
    
}


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
    let onRedeem: (ReceiptDetails) -> Void
    
    var body: some View {
        VStack{
            Text("ReceiptDetailsList")
            
            List(receipt) { item in
                ReceiptDetailsRow(receipt: item){
                    onRedeem(item)
                }
                
            }
            .navigationTitle("Receipts")
        }
    }
    
}


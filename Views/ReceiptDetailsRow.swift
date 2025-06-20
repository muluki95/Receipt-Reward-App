//
//  ReceiptDetails.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import SwiftUI

struct ReceiptDetailsRow: View {
    let receipt: ReceiptDetails
    var redeemAction: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Store Name: \(receipt.storeName)")
            Text("Date Scanned: \(dateFormatter.string(from: receipt.dateScanned))")
            Text("Total Amount: \(receipt.totalAmount, specifier: "%.2f")")
            Text("Points Earned: \(receipt.pointsEarned)")
            Text("Image URL: \(receipt.imageURL)")
            
            if let redeemAction = redeemAction {
                Button("Redeem"){
                    redeemAction()
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(5)
                .frame(width:100)
            }
        }
        .padding()
    }
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
}

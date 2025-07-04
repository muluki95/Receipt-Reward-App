//
//  ReceiptDetails.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import SwiftUI

struct ReceiptDetailsRow: View {
    let receipt: ReceiptDetails
    var onRedeem: (() -> Void)? = nil
    
    @ObservedObject var viewModel: ReceiptViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Store Name: \(receipt.storeName)")
            Text("Date Scanned: \(dateFormatter.string(from: receipt.dateScanned))")
            Text("Total Amount: \(receipt.totalAmount, specifier: "%.2f")")
            Text("Points Earned: \(receipt.pointsEarned)")
            Text("Image URL: \(String(describing: receipt.imageURL))")
            
            if let onRedeem = onRedeem {
                Button("Redeem"){
                   onRedeem()
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

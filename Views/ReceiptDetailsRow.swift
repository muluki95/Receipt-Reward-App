//
//  ReceiptDetails.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import SwiftUI

struct ReceiptDetailsRow: View {
    let receipt: ReceiptDetails
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Store Name: \(receipt.storeName)")
            Text("Date Scanned: \(dateFormatter.string(from: receipt.dateScanned))")
            Text("Total Amount: \(receipt.totalAmount, specifier: "%.2f")")
            Text("Points Earned: \(receipt.pointsEarned)")
            Text("Image URL: \(receipt.imageURL)")
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

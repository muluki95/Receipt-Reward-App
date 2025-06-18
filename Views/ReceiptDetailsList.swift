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
    
    var body: some View {
        VStack{
            Text("ReceiptDetailsList")
            
            List(receipt) { item in
                ReceiptDetailsRow(receipt: item)
            }
            .navigationTitle("Receipts")
        }
    }
    
}
struct ReceiptDetailsList_Previews: PreviewProvider {
    static var previews: some View {
        ReceiptDetailsList(receipt: [
            ReceiptDetails( id: UUID().uuidString,storeName: "Starbucks",totalAmount: 12.75,dateScanned: Date(),pointsEarned: 128,imageURL:"https://firebasestorage.googleapis.com/v0/b/your-app-id.appspot.com/o/images%2Fstarbucks_001.jpg?alt=media"),
            ReceiptDetails(id: UUID().uuidString, storeName: "Target", totalAmount:47.30, dateScanned: Date(), pointsEarned: 473, imageURL:"https://firebasestorage.googleapis.com/v0/b/your-app-id.appspot.com/o/images%2Ftarget_059.jpg?alt=media")
        ])
    }
}

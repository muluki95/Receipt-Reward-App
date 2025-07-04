//
//  ReceiptsDetails.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/8/25.
//

import Foundation

struct ReceiptDetails: Identifiable, Codable, Equatable, Hashable {
    var id: String
    var storeName: String
    var totalAmount: Double
    var dateScanned: Date
    var pointsEarned: Int
    var imageURL: URL?
   
}


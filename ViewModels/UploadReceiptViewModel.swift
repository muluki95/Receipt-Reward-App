//
//  Scan ReceiptsViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/6/25.
//

import Foundation
import SwiftUI
import FirebaseStorage
import FirebaseFirestore


@MainActor

class UploadReceiptViewModel: ObservableObject {
    @Published var isUploading: Bool = false
    @Published var errorMessage: String?
    @Published var receipt: ReceiptDetails?
    
    
   
    private let repository = ReceiptRepository()
    
    typealias Details = (image: UIImage, storeName: String, totalAmount: Double, pointsEarned: Int)
    
    func uploadReceipt(details: Details) async {
            isUploading = true
            errorMessage = nil

            do {
                let savedReceipt = try await repository.saveReceipt(
                    from: details.image,
                    storeName: details.storeName,
                    totalAmount: details.totalAmount,
                    pointsEarned: details.pointsEarned
                )
                self.receipt = savedReceipt
            } catch {
                errorMessage = error.localizedDescription
                print("❌ Failed to upload receipt: \(error.localizedDescription)")
            }

            isUploading = false
        }
    
}

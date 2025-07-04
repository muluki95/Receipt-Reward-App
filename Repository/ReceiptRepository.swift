//
//  ReceiptRepository.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/28/25.
//
import SwiftUI
import FirebaseFirestore

class ReceiptRepository {
    
    private let db = Firestore.firestore()
    private let collection = "receipts"
    
    func saveReceipt(from image: UIImage, storeName: String, totalAmount: Double, pointsEarned: Int ) async throws -> ReceiptDetails {
        let receiptID = UUID().uuidString
        let fileName = receiptID + ".jpg"
        
        var imageURL: URL? // ✅ Declare this BEFORE the do block
        
        // Upload image to Firebase Storage and get download URL
        let storageFile = StorageFile
            .with(namespace: collection, identifier: fileName)
        
        do {
            _ = try await storageFile.putImage(image)   //uploads the image to firebase storage
            
            print("Upload complete, getting download URL")
            
            imageURL = try await storageFile.getDownloadURL()   //get the public download url
            print("Got download URL: \(imageURL!.absoluteString)")
        } catch {
            print("Upload or getDownloadURL error: \(error.localizedDescription)")
            throw error
        }
        
        // ✅ Unwrap imageURL safely
        guard let finalURL = imageURL else {
            throw NSError(domain: "StorageURL", code: -1, userInfo: [NSLocalizedDescriptionKey: "Image URL could not be retrieved"])
        }
        
        //  ReceiptDetails object
        let receipt = ReceiptDetails(
            id: receiptID,
            storeName: storeName,
            totalAmount: totalAmount,
            dateScanned: Date(),
            pointsEarned: pointsEarned,
            imageURL: finalURL )
        
        // Save object to Firestore
        try db.collection(collection)
            .document(receiptID)
            .setData(from: receipt)
        
        print(" Receipt saved with image URL: \(String(describing: receipt.imageURL))")
        return receipt
    }
    // fetch method
    func fetchReceipts() async throws -> [ReceiptDetails] {
        let snapshot = try await db.collection(collection).getDocuments()
        let receipts = snapshot.documents.map { document in
            try! document.data(as:ReceiptDetails.self)
        }
        return receipts
    }
    
    //delete method
    func deleteReceipt(_ id: String) async throws {
        try await db.collection(collection).document(id).delete()
    }
}

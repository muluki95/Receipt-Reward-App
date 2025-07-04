//
//  ReceiptViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/19/25.
//

import SwiftUI

@MainActor
class ReceiptViewModel: ObservableObject {
    @Published var receipt: ReceiptDetails?
    @Published var allReceipts: [ReceiptDetails] = []
    @Published var searchText = ""
    
    
    
    
    var historyViewModel: HistoryViewModel
    var onReceiptParsed: (() -> Void)?

    private let receiptService = ReceiptService()
    private let repository = ReceiptRepository()
    
    
    init(historyViewModel: HistoryViewModel){
        self.historyViewModel = historyViewModel
    }
    
        
    func processScannedImage(_ image: UIImage, imageURL: URL) {
        print(" Starting text extraction...")
        receiptService.extractReceiptDetails(from:image){[weak self] text in
            print("Extracted Text:\n\(text)")
            DispatchQueue.main.async {
                guard let self = self else { return }
                let parsed = self.receiptService.parseReceiptText(text, imageURL: imageURL)
                print("Parsed Receipt: \(String(describing: parsed))")

                self.receipt = parsed  // saves parsed receipt to viewmodel
                self.historyViewModel.addForm(receipt: parsed)  // adds parsed receipt to historyviewmodel
                print("scannedReceipts count: \(self.historyViewModel.scannedReceipts.count)")
                self.onReceiptParsed?()  // notifies to switch tab

                
            }
            
        }
    }
    
    //fetch method
    
    func fetchReceipts() async {
        
            do{
                let receipts = try await repository.fetchReceipts()
                
                    allReceipts = receipts
                        
                
            } catch {
                print(" Error fetching the receipts: \(error.localizedDescription)")
            
        }
    }
    
    //delete method
    
    func deleteReceipt(receipt: ReceiptDetails) async {
            do{
                try await repository.deleteReceipt(receipt.id)
                allReceipts.removeAll{$0.id == receipt.id}
                
            } catch {
                print("Failed to delete receipt: \(error.localizedDescription)")
            }
        }
        
    
    
    var filteredReceipts: [ReceiptDetails] {
        if searchText.isEmpty {
            return allReceipts
        } else {
            return allReceipts.filter {
                $0.storeName.localizedCaseInsensitiveContains(searchText) || "\($0.totalAmount)".contains(searchText)
            }
        }
    }
}

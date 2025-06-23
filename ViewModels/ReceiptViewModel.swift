//
//  ReceiptViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/19/25.
//

import SwiftUI


class ReceiptViewModel: ObservableObject {
    @Published var receipt: ReceiptDetails?
    
    
    var historyViewModel: HistoryViewModel
    var onReceiptParsed: (() -> Void)?

    private let receiptService = ReceiptService()
    
    init(historyViewModel: HistoryViewModel){
        self.historyViewModel = historyViewModel
    }
    
        
    func processScannedImage(_ image: UIImage, imageURL: String = "") {
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
}

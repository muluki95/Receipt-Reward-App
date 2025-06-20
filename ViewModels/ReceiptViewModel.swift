//
//  ReceiptViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/19/25.
//

import SwiftUI


class ReceiptViewModel: ObservableObject {
    @Published var receipt: ReceiptDetails?
    
    
    var historyViewModel: HistoryViewModel?
    private let receiptService = ReceiptService()
    
    
    func processScannedImage(_ image: UIImage, imageURL: String = "") {
        print(" Starting text extraction...")
        receiptService.extractReceiptDetails(from:image){[weak self] text in
            print("Extracted Text:\n\(text)")
            DispatchQueue.main.async {
                let parsed = self?.receiptService.parseReceiptText(text, imageURL: imageURL)
                print(" Parsed Receipt: \(String(describing: parsed))")
                self?.receipt = parsed
                self?.historyViewModel?.addForm(receipt: parsed!)
                
                
            }
            
        }
    }
}

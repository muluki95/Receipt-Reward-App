//
//  ReceiptParser.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/18/25.
//
import Foundation
import Vision
import UIKit


        
class ReceiptService {
    func extractReceiptDetails(from image: UIImage, completion: @escaping(String)-> Void){
        guard let cgImage = image.cgImage else {
            completion("Failed to convert UIImage to CGImage.")
            return
        }
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("Text recognition error: \(error.localizedDescription)")
                completion("Recognition error.")
                return
            }
            let recognizedStrings = (request.results as? [VNRecognizedTextObservation])?.compactMap {
                $0.topCandidates(1).first?.string} ?? []
            
            let fullText = recognizedStrings.joined(separator: "\n")//combine the array into a single multiline string with line breaks
            completion(fullText) //return the full text to where the function was called
        }
        
        request.recognitionLevel = .accurate  // tells vision to prioritize accuracy
        request.usesLanguageCorrection = true
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? requestHandler.perform([request]) //executes the OCR request
    }
    
    func parseReceiptText(_ text: String, imageURL: URL) -> ReceiptDetails {
        let lines = text.components(separatedBy: .newlines)
        let store = lines.first ?? "Unknown Store"
        let amountLine = lines.first(where: { $0.contains("$") }) ?? "0.00"
        let total = Double(amountLine.filter("0123456789.".contains)) ?? 0.0
        
        return ReceiptDetails(
            id: UUID().uuidString,
            storeName: store,
            totalAmount: total,
            dateScanned: Date(),
            pointsEarned: Int(total),
            imageURL: imageURL
        )
    }
}

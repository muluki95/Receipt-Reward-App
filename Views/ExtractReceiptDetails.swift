//
//  ReceiptScanner.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/17/25.
//

import Vision



        
        
func extractReceiptDetails(from image: UIImage, completion: @escaping(String)-> Void){
    guard let cgImage = image.cgImage else {
        completion("Failed to convert UIImage to CGImage.")
        return
    }
    
    
    
    
}
    

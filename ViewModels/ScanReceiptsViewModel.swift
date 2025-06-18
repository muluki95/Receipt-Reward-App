//
//  Scan ReceiptsViewModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/6/25.
//

import Foundation
import SwiftUI

class ScanReciptsViewModel: ObservableObject {
    @Published var scannedImage: UIImage?
    @Published var isScanning = false
    
    
    
    func handleSubmit(){
        
    }
    
    func startScanning(){
        isScanning = true
    }
    
    func stopScanning(){
        isScanning = false
    }
}

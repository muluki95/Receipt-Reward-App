//
//  ScanReceiptsView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 5/31/25.
//

import Foundation
import SwiftUI


struct ScanReceiptsView: View {
    @State var scannedImage: UIImage?
    @State var isScanning = false
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = scannedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:300, height:300)
                        .cornerRadius(20)
                        .padding()
                    
                }
                Button(action:{
                    isScanning = true
                }){
                    Text("Scan Receipts")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:200, height:50)
                        .background(Color.blue)
                        .padding()
                        .cornerRadius(20)
                    
                }
            }
            .navigationTitle(Text("Scan Receipts"))
            .sheet(isPresented: $isScanning){
                
                //used on  mock images
#if targetEnvironment(simulator)
                if let mockImage = UIImage(named: "sample_receipt"){
                    ScannerMockView(image: mockImage){
                        self.scannedImage = mockImage
                        self.isScanning = false
                        
                    }
                    
                }else{
                    Text("Mock image not found")
                }
#else
                ScannerView { scanned in
                    self.scannedImage = scanned
                    self.isScanning = false
                    
                }
#endif
                
            }
        }
        
    }
    
}
                
                
                
#Preview {
    ScanReceiptsView()
    }
            

//
//  ScanReceiptsMockView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/15/25.
//

import SwiftUI

struct ScannerMockView: View {
    let image:UIImage
    let onComplete: () -> Void
    
    var body: some View {
        VStack {
            Text("Simulator Mock View")
                .font(.headline)
                .foregroundColor(.primary)
                .fontWeight(.bold)
                .padding()
            Image(uiImage: image)
                .resizable()
                .frame(width:300, height:300)
                .scaledToFit()
                .padding()
            Button("Done"){
                onComplete()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.black)
            .cornerRadius(10)
            
        }
        
    }
}

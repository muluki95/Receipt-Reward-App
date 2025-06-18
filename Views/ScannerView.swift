//
//  ScannerView.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/6/25.
//

import VisionKit
import UIKit
import SwiftUI


struct ScannerView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    var onScanCompleted: (UIImage) -> Void
    
    
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = context.coordinator
        return scanner
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context){
        
    }
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate{
        let parent: ScannerView
        
        init(parent: ScannerView ){
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan){
            if scan.pageCount > 0 {
                let image = scan.imageOfPage(at:0)  //scans only the first page
                parent.onScanCompleted(image)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController){
            parent.presentationMode.wrappedValue.dismiss()
        }
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error){
            print("Document failed to scan: \(error.localizedDescription)")
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

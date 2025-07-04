//
//  ImagePicker.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/27/25.
//

import SwiftUI
import UIKit


struct ImagePicker: UIViewControllerRepresentable {
    let onSelect:(URL) -> Void
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Environment(\.dismiss) var dismiss
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) ->  UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
        
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any])
        {
            guard let imageURL = info[.imageURL] as? URL else {return}
            parent.onSelect(imageURL)
            parent.dismiss()
            
            }
           
        }
    }


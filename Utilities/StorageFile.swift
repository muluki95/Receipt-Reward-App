//
//  StorageFile.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 6/27/25.
//
import Foundation
import FirebaseStorage
import UIKit

struct StorageFile {
    private let storageReference: StorageReference
    
    //upload file method
    func putFile(from fileURL: URL) async throws -> Self {
        _ = try await storageReference.putFileAsync (from: fileURL)
        return self
    }
    
    
    
    
    //   Uploads a UIImage as JPEG
    func putImage(_ image: UIImage) async throws -> Self {
            guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                throw NSError(domain: "ImageConversion", code: -1, userInfo: [
                    NSLocalizedDescriptionKey: "Could not convert UIImage to JPEG data."
                ])
            }

            _ = try await storageReference.putDataAsync(imageData, metadata: nil)
            return self
        }
    
    //retrieves the public URL of the uploaded file
    func getDownloadURL() async throws -> URL {
        return try await storageReference.downloadURL()
    }
    
    
    //deletes file from firebase Storage
    func delete() async throws {
        try await storageReference.delete()
    }
}

extension StorageFile {
    private  static let storage = Storage.storage()
    
    static func with (namespace: String, identifier: String) -> StorageFile {
        let path = "\(namespace)/\(identifier)"
        let storageReference = storage.reference().child(path)
        return StorageFile(storageReference: storageReference)
    }
    
    static func atURL(_ downloadURL:URL) -> StorageFile {
        let storageReference = storage.reference(forURL: downloadURL.absoluteString)
        return StorageFile(storageReference: storageReference)
    }
}

//
//  UserModel.swift
//  ReceiptsRewards
//
//  Created by Esther Nzomo on 5/31/25.
//

import Foundation
import SwiftUI

struct UserModel: Identifiable, Codable {
    let id: String
    var name: String
    var totalPoints: Int
}

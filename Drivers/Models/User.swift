//
//  User.swift
//  Drivers
//
//  Created by Diarmuid on 20/01/2025.
//

import SwiftUI
import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

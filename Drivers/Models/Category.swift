//
//  CategoryModel.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI
import Foundation

enum Category: String, CaseIterable, Codable {
    case general = "General Freight"
    case refrigerated = "Refrigerated"
    case hazardous = "Hazardous Materials (ADR)"
    case livestock = "Livestock"
    case construction = "Construction Materials"
    case bulk = "Dry Bulk"
    case liquid = "Liquid Bulk"
    case container = "Container"
    case automotive = "Automotive"
    case other = "Waste & Recycling"
    
    var icon: String {
        switch self {
        case .general:
            return "shippingbox.fill"
        case .refrigerated:
            return "thermometer.snowflake"
        case .hazardous:
            return "exclamationmark.triangle.fill"
        case .livestock:
            return "dog.fill"
        case .construction:
            return "building.fill"
        case .bulk:
            return "cylinder.fill"
        case .liquid:
            return "drop.circle.fill"
        case .container:
            return "shippingbox.circle.fill"
        case .automotive:
            return "car.fill"
        case .other:
            return "arrow.3.trianglepath"
        }
    }
}

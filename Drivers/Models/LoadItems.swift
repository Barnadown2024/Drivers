//
//  LoadItems.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import Foundation

struct LoadItems: Identifiable {
    let id: UUID
    let date: Date
    let loadNo: String
    let destination: String
    let weight: String
    let truckNo: String
    let mileage: String
    let category: String
    let pickup: String
    
    // Conversion initializer
    init(from loaditems: LoadItems) {
        self.id = loaditems.id
        self.date = loaditems.date
        self.loadNo = loaditems.loadNo
        self.destination = loaditems.destination
        self.weight = loaditems.weight
        self.truckNo = loaditems.truckNo
        self.mileage = loaditems.mileage
        self.category = loaditems.category
        self.pickup = loaditems.pickup
    }
}

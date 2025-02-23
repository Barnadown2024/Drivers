//
//  NewItemViewViewModel.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import Foundation
import Combine
import SwiftUI

class NewItemViewViewModel: ObservableObject {
    @Published var loadId: UUID?
    @Published var loadDate: Date = Date()
    @Published var loadtruckNo: String = ""
    @Published var loadNo: String = ""
    @Published var loadCategory: String = ""
    @Published var loadMileage: String = ""
    @Published var loadType: String = ""
    @Published var loadPickup: String = ""
    @Published var loadDestination: String = ""
    @Published var loadWeight: String = ""
    @Published var loadAdditionalInfo: String = ""
    
    init(loaditems: LoadItems? = nil) {
        if let loaditems = loaditems {
            self.loadId = loaditems.id
            self.loadDate = loaditems.date
            self.loadtruckNo = loaditems.truckNo
            self.loadNo = loaditems.loadNo
            self.loadCategory = loaditems.category
            self.loadMileage = loaditems.mileage
            self.loadPickup = loaditems.pickup
            self.loadDestination = loaditems.destination
            self.loadWeight = loaditems.weight
        }
    }
    
    func save(completion: @escaping (Bool) -> Void) {
        if validateFields() {
            // Save logic here
            completion(true)
        } else {
            completion(false)
        }
    }
    
    var canSave: Bool {
        guard !loadDate.timeIntervalSince1970.isZero else {
            return false
        }
        return true
    }
    
    private func validateFields() -> Bool {
        return !loadtruckNo.isEmpty &&
               !loadNo.isEmpty &&
               !loadPickup.isEmpty &&
               !loadDestination.isEmpty &&
               !loadWeight.isEmpty
    }
}


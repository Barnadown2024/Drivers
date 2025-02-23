//
//  NewItemListViewViewModel.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import Foundation
import Combine

/// View Model for the List View of all Record

class NewItemListViewViewModel: ObservableObject {
    @Published var loads: [LoadItems] = []
    @Published var showingNewItemView = false
    @Published var showingDetailView = false
    @Published var selectedLoadItems: LoadItems?

    // Example function to add a new load
    func addLoadItems(date: Date, loadNo: String, destination: String, weight: String) {
        let newLoad = Load(id: UUID(), date: date, loadNo: loadNo, destination: destination, weight: weight)
        load.append(newLoad)
    }

    func addOrUpdateLoad(_ loaditems: LoadItems) {
        if let index = loads.firstIndex(where: { $0.id == loaditems.id }) {
            loads[index] = loaditems
        } else {
            load.append(Load)
        }
    }
}

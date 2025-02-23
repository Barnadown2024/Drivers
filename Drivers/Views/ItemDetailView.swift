//
//  ItemDetail.swift
//  Drivers
//
//  Created by Diarmuid on 21/01/2025.
//

import SwiftUI

// Ensure you import the correct module where Load is defined
// import Drivers // Uncomment if Load is defined in a module named Drivers

struct ItemDetailView: View {
    @StateObject var viewModel: NewItemViewViewModel
    @Binding var isPresented: Bool
    var updateLoad: (LoadItems) -> Void
    
    init(loaditems: LoadItems, isPresented: Binding<Bool>, updateLoad: @escaping (LoadItems) -> Void) {
        self._isPresented = isPresented
        self.updateLoad = updateLoad
        _viewModel = StateObject(wrappedValue: NewItemViewViewModel(loaditems: LoadItems(from: loaditems)))
    }
    
    var body: some View {
        VStack {
            Text("Edit Load")
                .font(.system(size: 24))
                .bold()
            
            Form {
                DatePicker("Date", selection: $viewModel.loadDate)
                    .datePickerStyle(CompactDatePickerStyle())
                
                TextField("Truck No./Trailer No.", text: $viewModel.loadtruckNo)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Mileage", text: $viewModel.loadMileage)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Load No", text: $viewModel.loadNo)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Load Category", text: $viewModel.loadCategory)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Load Type", text: $viewModel.loadType)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Pickup", text: $viewModel.loadPickup)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Destination", text: $viewModel.loadDestination)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Weight", text: $viewModel.loadWeight)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Additional Comments", text: $viewModel.loadAdditionalInfo)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Save",
                    background: .blue
                ) {
                    viewModel.save { success in
                        if success {
                            let updatedLoad = Load(
                                id: viewModel.loadId ?? UUID(),
                                date: viewModel.loadDate,
                                loadNo: viewModel.loadNo,
                                destination: viewModel.loadDestination,
                                weight: viewModel.loadWeight,
                                truckNo: viewModel.loadtruckNo,
                                mileage: viewModel.loadMileage,
                                category: viewModel.loadCategory,
                                pickup: viewModel.loadPickup
                            )
                            updateLoad(updateloaditems)
                            isPresented = false
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(
            loaditems: LoadItems(id: UUID(), date: Date(), loadNo: "123", destination: "Destination", weight: "1000", truckNo: "Truck123", mileage: "500", category: "Category1", pickup: "Pickup1"),
            isPresented: .constant(true),
            updateLoad: { _ in }
        )
    }
}

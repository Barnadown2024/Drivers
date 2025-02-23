//
//  NewItemView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel: NewItemViewViewModel
    @Binding var newItemPresented: Bool
    var addOrUpdateLoad: (LoadItems) -> Void
    @State private var showAlert = false
    
    init(newItemPresented: Binding<Bool>, loadItems: LoadItems? = nil, addOrUpdateLoad: @escaping (LoadItems) -> Void) {
        self._newItemPresented = newItemPresented
        self.addOrUpdateLoad = addOrUpdateLoad
        _viewModel = StateObject(wrappedValue: NewItemViewViewModel(loaditems: loadItems))
    }
    
    var body: some View {
        VStack {
            Text("New Load")
                .font(.system(size: 24))
                .bold()
            
            Form {
                // Truck Details
                DatePicker("Date", selection: $viewModel.loadDate, displayedComponents: .date)
                
                TextField("Truck No./Trailer No.", text: $viewModel.loadtruckNo)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Mileage", text: $viewModel.loadMileage)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Load Details
                TextField("Load No", text: $viewModel.loadNo)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Load Category", text: $viewModel.loadCategory)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Pickup", text: $viewModel.loadPickup)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Destination", text: $viewModel.loadDestination)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Weight", text: $viewModel.loadWeight)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Additional Comments on the load
                TextField("Additional Comments", text: $viewModel.loadAdditionalInfo)
                    .textFieldStyle(DefaultTextFieldStyle())
            }
                
                TLButton(
                    title: "Save",
                    background: .pink
                ) {
                    viewModel.save { success in
                        if success {
                            let loadItems = LoadItems(
                                ifrom: <#LoadItems#>, d: viewModel.loadId ?? UUID(),
                                date: viewModel.loadDate,
                                loadNo: viewModel.loadNo,
                                destination: viewModel.loadDestination,
                                weight: viewModel.loadWeight,
                                truckNo: viewModel.loadtruckNo,
                                mileage: viewModel.loadMileage,
                                category: viewModel.loadCategory,
                                pickup: viewModel.loadPickup
                            )
                            addOrUpdateLoad(loadItems)
                            newItemPresented = false
                        } else {
                            showAlert = true
                        }
                    }
                }
                .padding()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Missing Information"),
                  message: Text("Please fill in all mandatory fields."),
                  dismissButton: .default(Text("OK"))
        }
                  }
struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }), addOrUpdateLoad: { _ in })
    }
}


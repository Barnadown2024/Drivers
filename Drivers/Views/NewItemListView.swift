//
//  NewItemListView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct Load: Identifiable {
    let id: UUID
    let date: Date
    let loadNo: String
    let destination: String
    let weight: String
}

struct NewItemListView: View {
    @StateObject var viewModel = NewItemListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.loads) { load in
                    VStack(alignment: .leading) {
                        Text("Date: \(formattedDate(load.date))")
                        Text("Load No: \(load.loadNo)")
                        Text("Destination: \(load.destination)")
                        Text("Weight: \(load.weight)")
                    }
                    .padding(.vertical, 5)
                    .onTapGesture {
                        viewModel.selectedLoad = load
                        viewModel.showingDetailView = true
                    }
                }
                .onDelete(perform: deleteLoad)
            }
            .navigationTitle("List of Loads")
            .toolbar {
                Button {
                    viewModel.selectedLoad = nil
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $viewModel.showingNewItemView) {
            NewItemView(newItemPresented: $viewModel.showingNewItemView, load: viewModel.selectedLoad) { load in
                viewModel.addOrUpdateLoad(load)
            }
        }
        .sheet(isPresented: $viewModel.showingDetailView) {
            if let selectedLoad = viewModel.selectedLoad {
                ItemDetailView(load: selectedLoad, isPresented: $viewModel.showingDetailView) { updatedLoad in
                    viewModel.addOrUpdateLoad(updatedLoad)
                }
            }
        }
    }
    
    private func deleteLoad(at offsets: IndexSet) {
        viewModel.loads.remove(atOffsets: offsets)
    }
}

private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter.string(from: date)
}

struct NewItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemListView(userId: "")
    }
}

//
//  ContentView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    private var accountView: some View {
        TabView {
            ProfileView(userid: viewModel.currentUserId)
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person.circle")
                        .foregroundColor(.blue)
                }
            NewItemListView(userId: viewModel.currentUserId)
                .tabItem {
                    Text("Load List")
                    Image(systemName: "list.bullet.circle.fill")
                        .foregroundColor(.blue)
                }
            HolidayView()
                .tabItem {
                    Text("Holiday")
                    Image(systemName: "airplane.departure")
                        .foregroundColor(.blue)
                }
            SalaryView(userid: viewModel.currentUserId)
                .tabItem {
                    Text("Salary")
                    Image(systemName: "eurosign.circle.fill")
                        .foregroundColor(.blue)
                }
            SendView(userid: viewModel.currentUserId)
                .tabItem {
                    Text("Send")
                    Image(systemName: "envelope")
                        .foregroundColor(.blue)
                }
        }
    }
}

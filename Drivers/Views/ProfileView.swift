//
//  ProfileView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    private let userid: String
    init(userid: String){
        self.userid = userid
    }
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profle(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle(Text("Profile"))
        }
        .padding(.top, -75)
        .onAppear {
            viewModel.fetchUser()
        }
    }
    

    
    @ViewBuilder
    func profle(user: User) -> some View {
        Spacer()
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 100, height: 100)
            .foregroundColor(.blue)

        // Info: Name, Email, Member Since
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .font(.system(size: 12))
                Text(user.name)
                    .font(.system(size: 12))
            }
            HStack {
                Text("Email: ")
                    .font(.system(size: 12))
                Text(user.email)
                    .font(.system(size: 12))

            }
            HStack {
                Text("Member Since: ")
                    .font(.system(size: 12))
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .font(.system(size: 12))

            }
            
        }
        
        // Sign Out
        Button("Log Out") {
            viewModel.logout()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView(userid: "")
        }
    }
}


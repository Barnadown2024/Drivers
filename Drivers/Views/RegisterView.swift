//
//  RegisterView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register",
                       subtitle: "Register your details",
                       angle: 15,
                       background: .green)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())

                // TLButton for Registration
                TLButton(
                    title: "Create Account",
                    background: .green) {
                    // Attempt Registration
                    viewModel.register()
                }
                .padding()
            }
            .padding(.top, -60)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

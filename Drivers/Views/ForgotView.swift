//
//  ForgotView.swift
//  Drivers
//
//  Created by Diarmuid on 21/01/2025.
//

import SwiftUI

struct ForgotView: View {
    @StateObject var viewModel = ForgotViewViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Forgot Password",
                       subtitle: "Enter your email to reset your password",
                       angle: 15,
                       background: .orange)
            
            Form {
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                TLButton(
                    title: "Reset Password",
                    background: .orange) {
                    viewModel.resetPassword { success in
                        if success {
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            // Handle error (e.g., show an alert)
                        }
                    }
                }
                .padding()
            }
            .padding()
        }
    }
}

struct ForgotView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotView()
    }
}

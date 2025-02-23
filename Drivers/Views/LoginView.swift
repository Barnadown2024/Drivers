//
//  LoginView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(
                    title: "Truck Driver", 
                    subtitle: "Smart Solutions for Smart Truckers", 
                    angle: 15, 
                    background: .red)
                    .edgesIgnoringSafeArea(.all)
                //Login Form
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        
                    TLButton(
                            title: "Log In",
                             background: .blue) {
                            viewModel.login()
                    }
                    .padding()
                }
                
                //Create Account and Forgot Password
                VStack {
                    Text("Don't have an account?")
                        .font(.system(size: 12))
                        .padding(1)
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("Create an account")
                            .font(.system(size: 12))
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: ForgotView()) {
                        Text("Forgot Password?")
                            .font(.system(size: 12))
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 2)
                }
                .padding(.bottom, 5)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

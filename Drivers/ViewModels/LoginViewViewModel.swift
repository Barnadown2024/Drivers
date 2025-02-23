//
//  LoginViewViewModel.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init () {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try login
        Auth.auth().signIn(withEmail: email, password: password)
        }
    
    private func validate() -> Bool {
            errorMessage = ""
            guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                errorMessage = "Please Fill in all fields"
                return false
            }
            guard email.contains("@") && email.contains(".") else {
                errorMessage = "Please input valid email"
                return false
            }
            return true
    }
}

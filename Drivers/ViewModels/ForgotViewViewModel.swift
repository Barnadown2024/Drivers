//
//  ForgotViewViewModel.swift
//  Drivers
//
//  Created by Diarmuid on 21/01/2025.
//

import Foundation
import SwiftUI
import FirebaseAuth

class ForgotViewViewModel: ObservableObject {
    @Published private var currentPassword: String = ""
    @Published private var newPassword: String = ""
    @Published private var confirmNewPassword: String = ""
    @Published var email: String = ""
    
    func resetPassword(completion: @escaping (Bool) -> Void) {
        guard !email.isEmpty else {
            // Handle empty email case
            completion(false)
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                // Handle error (e.g., show an alert)
                print("Error sending password reset: \(error.localizedDescription)")
                completion(false)
            } else {
                // Handle success (e.g., show a confirmation message)
                print("Password reset email sent.")
                completion(true)
            }
        }
    }
}

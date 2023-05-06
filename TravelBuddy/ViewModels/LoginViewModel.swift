//
//  LoginViewModel.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-18.
//

import Foundation
import Firebase
import SwiftUI

final class LoginViewModel: ObservableObject {
    @Published var email=""
    @Published var password=""
    @Published var userIsLoggedIn = false
    
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func logout(){
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
        }
    }
    
    func createAccount() {
        Task{
            let user = try await Auth.auth().createUser(withEmail: email, password: password)
            print(user, "Konto skapat")
        }
    }
}

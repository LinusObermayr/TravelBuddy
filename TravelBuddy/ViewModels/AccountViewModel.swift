//
//  AccountViewModel.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-20.
//

import Foundation
import Firebase
import SwiftUI

final class AccountViewModel: ObservableObject {
    
   @Published var userIsLoggedIn = false
   
    
    func logout(){
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
        }
    }

}


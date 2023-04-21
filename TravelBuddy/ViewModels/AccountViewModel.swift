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
    
    @ObservedObject var rootViewModel: RootViewModel
    
    init(rootViewModel: RootViewModel) {
        self.rootViewModel = rootViewModel
    }
   
    
    func logout(){
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        rootViewModel.userIsLoggedIn=false
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
   
}
    
   }

}


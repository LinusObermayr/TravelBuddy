//
//  MainView.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-18.
//

import SwiftUI
import Firebase

struct MainView: View {
    @ObservedObject var rootViewModel: RootViewModel
    
    var body: some View {
        Button(action: {
            logout()
        }
               , label: {
            Text("Log out")
                .foregroundColor(.black)
                .padding(.vertical, 10)
                .frame(width: 200, height:40)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.linearGradient(colors: [.brown], startPoint: .bottom, endPoint: .topTrailing))
            
    )})
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
/*
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}*/

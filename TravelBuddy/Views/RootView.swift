//
//  RootView.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-18.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var viewModel = RootViewModel()
    
    var body: some View {
        
        if viewModel.userIsLoggedIn {
            MainView(rootViewModel: viewModel) //ändra denna till main för att gå dit efter inlogg
            }
        else {
            LoginView(rootViewModel: viewModel)
          }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

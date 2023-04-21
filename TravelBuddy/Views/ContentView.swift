//
//  ContentView.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
            TabView {
                MainView()
                    .tabItem {
                        Image(systemName: "checkmark.square.fill")
                        Text("Bokade")
                    }
                AddTripView()
                    .tabItem {
                        Image(systemName: "plus.app.fill")
                        Text("Ny resa")
                    }
                PacklistView()
                    .tabItem {
                        Image(systemName: "checklist")
                        Text("Packlista")
                            
                    }
                AccountView()
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profil")
                            
                    }
                    
            
                }.accentColor(.brown)
        
            
                
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  MainView.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-18.
//

import SwiftUI
import Firebase

struct MainView: View {
   // @ObservedObject var rootViewModel: RootViewModel
    let items = [
           Item(image: "copenhagen", title: "Köpenhamn", date: "September 1, 2023"),
           Item(image: "london", title: "London", date: "Maj 3, 2024"),
           Item(image: "bali2", title: "Bali", date: "Juli 22, 2024"),
           Item(image: "prag", title: "Prag", date: "April 4, 2025")
       ]
   
    var body: some View {
      /*  Button(action: {
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
            
    )})*/
        
        ZStack {
            NavigationView {
                        ScrollView(.vertical) {
                            VStack {
                                ForEach(items) { item in
                                    NavigationLink(destination: DetailView(item: item)) {
                                        VStack(spacing: 10) {
                                            Image(item.image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .clipped()
                                                .padding(-10)
                                                
                                            Text(item.title)
                                                .font(.headline)
                                                .padding()
                                                .foregroundColor(.black)
                                            Text(item.date)
                                                .font(.subheadline)
                                                .padding(-20)
                                                .foregroundColor(.black)
                                        }
                                        .frame(width: 360, height: 320)
                                        .background(Color.brown.opacity(0.7))
                                        .cornerRadius(10)
                                        .padding(2)
                                    }
                                }
                            }
                        }
                        .navigationBarTitle(Text("Resor"))
                        .offset(x:0, y: 60)
                        .padding(.top, -30)
                        .padding(.bottom, 100)
                        
            }.padding(.top, 40)
            .offset(x:0, y:-80)
        }

        TabView{
            
        }
    }
    
   /* func logout(){
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        rootViewModel.userIsLoggedIn=false
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
        }
    }*/
}
struct DetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text(item.title)
                .font(.title)
                .foregroundColor(.primary)
            Text(item.date)
                .font(.subheadline)
                .foregroundColor(.secondary)
                
            Spacer()
        }
        .navigationBarTitle(item.title)
        
    }
}

struct Item: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let date: String
}








struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

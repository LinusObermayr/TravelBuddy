//
//  AddTripView.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-20.
//

import SwiftUI

struct AddTripView: View {
    @Environment(\.presentationMode) var presentationMode
        
        @State private var image = ""
        @State private var title = ""
        @State private var date = ""
        
        var body: some View {
            NavigationView {
                VStack {
                    TextField("Image name", text: $image)
                        .padding()
                    TextField("Title", text: $title)
                        .padding()
                    TextField("Date", text: $date)
                        .padding()
                    
                    Button("Save") {
                        let newItem = Item(image: image, title: title, date: date)
                        // You could add the new item to your existing array of items here
                        // For example, you could create an @State array of items in your parent view,
                        // and append the new item to that array.
                        
                        // After you've added the new item, dismiss this view.
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .navigationBarTitle("Add Item")
            }
        }
}

struct AddTripView_Previews: PreviewProvider {
    static var previews: some View {
        AddTripView()
    }
}

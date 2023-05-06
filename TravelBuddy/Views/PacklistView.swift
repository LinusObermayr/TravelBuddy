//
//  PacklistView.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-20.
//

import SwiftUI

struct PacklistView: View {
    
    @State var lists = ["Packning Bali"]
    @State var newList = ""
    
    var body: some View {
        
            NavigationView {
            
                VStack {
                    HStack{
                    TextField("Ny kategori", text: $newList)
                        .padding()
                    Button(action: {
                        lists.append(newList)
                        newList = ""
                    }) {
                        Text("Lägg till")
                    }.padding(20)
                    }
                    
                    List {
                              ForEach(lists, id: \.self) { list in
                                  NavigationLink(destination: PackListDetailView(listName: list)) {
                                      Text(list)
                                  }
                              }
                              .onDelete { indices in
                                  lists.remove(atOffsets: indices)
                              }
                          }
                   
                          .navigationTitle("Listor")
                          
                          
                         
                }
            }
        
          }
      }

      struct PackListDetailView: View {
          @State var sublists = [""]
          @State var newSublist = ""
          @State var checkedItems = Set<Int>()
          
          let listName: String

          var body: some View {
              VStack {
                  List {
                      HStack {
                          TextField("Skriv här", text: $newSublist)
                              .padding()

                          Button(action: {
                          sublists.append(newSublist)
                          newSublist = ""
                            }) {
                          Text("Lägg till")
                        
                      }
                     
                      }
                      ForEach(sublists.indices, id: \.self) { index in
                                          HStack {
                                              Image(systemName: checkedItems.contains(index) ? "checkmark.square.fill" : "square")
                                                  .onTapGesture {
                                                      if checkedItems.contains(index) {
                                                          checkedItems.remove(index)
                                                      } else {
                                                          checkedItems.insert(index)
                                                      }
                                                  }
                                              Text(sublists[index])
                                                  .strikethrough(checkedItems.contains(index))
                                          }
                                      }
                      .onDelete { indices in
                          let indexSet = IndexSet(indices)
                          sublists.remove(atOffsets: indexSet)
                      }
                                  }
                              }
              .navigationBarTitle(listName, displayMode: .inline)
                          
                          
                          }
                      }


struct PacklistView_Previews: PreviewProvider {
    static var previews: some View {
        PacklistView()
    }
}

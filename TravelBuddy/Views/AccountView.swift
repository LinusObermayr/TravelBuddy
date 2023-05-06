//
//  AccountView.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-20.
//

import SwiftUI

struct AccountView: View {
    
   // @EnvironmentObject var viewModel = AccountViewModel()
    
    var body: some View {
          Button(action: {
              //logout()
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
}
/*
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
*/

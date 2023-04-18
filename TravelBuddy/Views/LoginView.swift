//
//  LoginView.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-18.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @ObservedObject var rootViewModel: RootViewModel
    
    var body: some View {
        
    
        ZStack {
            Image("loginbackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
           
            VStack(spacing: 20) {
                
            
                    Text("TravelBuddy")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .bold()
                        .foregroundColor(.black)
                        .offset(x: 0, y: -170)
                        
                        
                    
                TextField("Email", text: $viewModel.email)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .disableAutocorrection(true)
                    .placeholder(when: viewModel.email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.black)
                            .bold()
                    }
                    
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(.black)
                
                        
                SecureField("Password", text: $viewModel.password)
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .placeholder(when: viewModel.password.isEmpty){
                            Text("Password")
                                .foregroundColor(.black)
                                .bold()
                        }
                
                Rectangle()
                    .frame(width: 350, height: 2)
                    .foregroundColor(.black)
                    
                    
            
                    
                    Button(action: {
                        viewModel.login()
                    }
                           , label: {
                        Text("Login")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(width: 200, height:40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.brown], startPoint: .bottom, endPoint: .topTrailing))
                        
                )}).padding(.top)
                    .onAppear(){
                        
                        Auth.auth().addStateDidChangeListener{ auth, user in
                            if user != nil {
                                rootViewModel.userIsLoggedIn.toggle()
                            }
                        }
                    
                    }
            Button(action: {
                viewModel.createAccount()
            }, label: {
                Text("Don't have an account? Create")
                    .foregroundColor(.black)
                    .bold()
                    .padding(.vertical, 30)
                    
                    .frame(width: 255, height:40)
                    })
            
        }
            .frame(width: 350)
            
                                    
        }
        
    }
        
}

/*
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}*/

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

//
//  ContentView.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 08/08/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var isLoggedIn: Bool
    @State private var navigateRegister: Bool = false
    @State private var navigateLogin: Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Trees")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                
                HStack(){
                    VStack{
                        Button(action: {
                            navigateRegister = true
                        }, label: {
                            Text("Sign Up")
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 220, height: 50)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }).padding(.vertical, 60)
                        NavigationLink(destination: RegisterView(isLoggedIn: $isLoggedIn), isActive: $navigateRegister){EmptyView()}
                        
                        Button(action: {
                            navigateLogin = true
//                            isLoggedIn = true
                        }, label: {
                            Text("Login")
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 220, height: 50)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        })
                        
                        NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn), isActive: $navigateLogin){EmptyView()}
                    }.padding()
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView(isLoggedIn: .constant(false))
}

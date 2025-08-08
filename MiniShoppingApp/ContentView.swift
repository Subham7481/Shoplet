//
//  ContentView.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 08/08/25.
//

import SwiftUI

struct ContentView: View {
    @Binding var isLoggedIn: Bool
    @State private var navigateHome: Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Trees")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                
                HStack(){
                    VStack{
                        Button(action: {
                            navigateHome = true
                            isLoggedIn = true
                        }, label: {
                            Text("Sign Up")
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 220, height: 50)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        }).padding(.vertical, 60)
                        
                        Button(action: {
                            navigateHome = true
                            isLoggedIn = true
                        }, label: {
                            Text("Login")
                                .font(.system(size: 18, weight: .bold))
                                .frame(width: 220, height: 50)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(10)
                        })
                        
                        NavigationLink(destination: HomeView(), isActive: $navigateHome){EmptyView()}
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

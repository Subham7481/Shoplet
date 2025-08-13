//
//  ProfileView.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 08/08/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var navigateLogin: Bool = false
    let appwrite = AppWrite()
    var body: some View {
        VStack{
            Button(action: {
                Task{
                    navigateLogin = true
                   try await appwrite.onLogout()
                }
            }, label: {
                Text("Logout")
                    .font(.system(size: 18, weight: .bold))
                    .frame(width: 330, height: 50)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
            
            NavigationLink(destination: LoginView(isLoggedIn: .constant(true)), isActive: $navigateLogin){EmptyView()}
        }
    }
}

#Preview {
    ProfileView()
}

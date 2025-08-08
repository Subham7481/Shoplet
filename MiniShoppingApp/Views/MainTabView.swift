//
//  MainTabView.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 08/08/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            CartView()
                .tabItem{
                    Image(systemName: "cart.circle")
                    Text("Cart")
                }
            
            Notification()
                .tabItem{
                    Image(systemName: "bell")
                    Text("Notifications")
                }
            
            FavouriteView()
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favourites")
                }
            
            ProfileView()
                .tabItem{
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }.ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MainTabView()
}

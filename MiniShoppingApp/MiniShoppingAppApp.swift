//
//  MiniShoppingAppApp.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 08/08/25.
//

import SwiftUI

@main
struct MiniShoppingAppApp: App {
    @State private var isLoggedIn: Bool = false
    init(){
        sleep(2)
    }
    var body: some Scene {
        WindowGroup {
            if isLoggedIn{
                MainTabView()
            } else {
                ContentView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

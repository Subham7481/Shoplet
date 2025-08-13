//
//  LoginViewModel.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 11/08/25.
//

import Foundation
class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    
    func validate(){
        if(email.isEmpty || password.isEmpty){
            errorMessage = "Please fill all the fields."
        } else if !(email.contains(".") && email.contains("@")){
            errorMessage = "Please enter a valid email address."
        } else {
            errorMessage = ""
        }
    }
}

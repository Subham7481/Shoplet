//
//  RegisterViewModel.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 11/08/25.
//

import Foundation
final class RegisterViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String?
    
//    private let service: AppWrite
    
    func validate() -> Bool{
        if(name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty){
            errorMessage = "Please fill all the fields."
            return false
        } else if(password != confirmPassword){
            errorMessage = "Password does not match."
            return false
        } else if !(email.contains(".") && email.contains("@")){
            errorMessage = "Please enter a valid email address."
            return false
        }
        return true
    }
}

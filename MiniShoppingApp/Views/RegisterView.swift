//
//  RegisterView.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 11/08/25.
//

import SwiftUI

struct RegisterView: View {
    @Binding var isLoggedIn: Bool
    var body: some View {
        RegisterComponents(isLoggedIn: $isLoggedIn)
    }
}

struct RegisterComponents: View {
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var navigateLogin: Bool = false
    @Binding var isLoggedIn: Bool
    @ObservedObject var viewModel = RegisterViewModel()
    let appwrite = AppWrite()

    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: geometry.size.height * 0.03) {
                        
                        HStack {
                            Text("Welcome")
                                .font(.system(size: geometry.size.width * 0.06, weight: .bold))
                            Spacer()
                        }
                        .padding(.horizontal, geometry.size.width * 0.05)
                        
                        //Name Field
                        HStack {
                            Image(systemName: "pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.06, height: geometry.size.width * 0.06)
                                .padding(.leading, geometry.size.width * 0.03)
                            
                            TextField("Name", text: $viewModel.name)
                                .padding(.vertical, geometry.size.height * 0.015)
                                .padding(.horizontal, geometry.size.width * 0.02)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 0.5)
                        )
                        .padding(.horizontal, geometry.size.width * 0.05)
                        
                        // Email Field
                        HStack {
                            Image("email1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.06, height: geometry.size.width * 0.06)
                                .padding(.leading, geometry.size.width * 0.03)
                            
                            TextField("Email address", text: $viewModel.email)
                                .autocapitalization(.none)
                                .padding(.vertical, geometry.size.height * 0.015)
                                .padding(.horizontal, geometry.size.width * 0.02)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 0.5)
                        )
                        .padding(.horizontal, geometry.size.width * 0.05)
                        
                        // Password Field
                        HStack {
                            Image(systemName: "lock.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.06, height: geometry.size.width * 0.06)
                                .padding(.leading, geometry.size.width * 0.03)
                            
                            SecureField("Password", text: $viewModel.password)
                                .autocapitalization(.none)
                                .padding(.vertical, geometry.size.height * 0.015)
                                .padding(.horizontal, geometry.size.width * 0.02)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 0.5)
                        )
                        .padding(.horizontal, geometry.size.width * 0.05)
                        
                        //Confirm Password Field
                        HStack {
                            Image(systemName: "lock.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.06, height: geometry.size.width * 0.06)
                                .padding(.leading, geometry.size.width * 0.03)
                            
                            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                                .autocapitalization(.none)
                                .padding(.vertical, geometry.size.height * 0.015)
                                .padding(.horizontal, geometry.size.width * 0.02)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 0.5)
                        )
                        .padding(.horizontal, geometry.size.width * 0.05)
                        
                        // Forgot Password
                        HStack {
                            Spacer()
                            NavigationLink(destination: ForgotPasswordView()){
                                Text("Forgot ")
                                    .font(.system(size: geometry.size.width * 0.04, weight: .bold))
                                    .foregroundColor(Color.green)
                                
                                Text("password?")
                                    .font(.system(size: geometry.size.width * 0.04, weight: .bold))
                                    .foregroundColor(Color.orange)
                            }
                        }
                        .padding(.horizontal, geometry.size.width * 0.05)
                        
                        // Register Button
                        Button(action: {
                            viewModel.validate()
                            Task{
                                try await appwrite.onRegister(viewModel.email, viewModel.password)
                            }
                        }, label: {
                            Text("Register")
                                .font(.system(size: geometry.size.width * 0.045, weight: .bold))
                                .frame(width: geometry.size.width * 0.88, height: geometry.size.height * 0.06)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.blue, Color.indigo]), startPoint: .leading, endPoint: .trailing
                                    )
                                )
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                        NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn), isActive: $navigateLogin){EmptyView()}
                        .alert("Registration", isPresented: $showAlert){
                            Button("OK"){
                                navigateLogin = true
                            }
                        } message: {
                            Text("Registration sucessful, please login!")
                        }
                        
                        Text("or login with")
                        
                        HStack(spacing: geometry.size.width * 0.05) {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.22, height: geometry.size.height * 0.05)

                            Image("facebook")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.22, height: geometry.size.height * 0.05)

                            Image("mac")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.22, height: geometry.size.height * 0.05)
                        }
                        .frame(maxWidth: .infinity)

                        HStack{
                            Text("Already have an account?")
                            
                            NavigationLink(destination: LoginView(isLoggedIn: $isLoggedIn)){
                                Text("Login")
                                    .foregroundColor(Color.blue)
                            }
                        }
                        Spacer()
                        if let error = viewModel.errorMessage, !error.isEmpty{
                            Text(viewModel.errorMessage ?? "")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(Color.red)
                        }
                    }
                    .frame(minHeight: geometry.size.height)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    RegisterView(isLoggedIn: .constant(false))
}

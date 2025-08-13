//
//  AppWrite.swift
//  MiniShoppingApp
//
//  Created by Subham Patel on 11/08/25.
//

import Foundation
import Appwrite
import JSONCodable
class AppWrite{
    var client: Client
    var account: Account
    
    init(){
        self.client = Client()
            .setEndpoint("https://cloud.appwrite.io/v1")
            .setProject("68997ec6000ecf9d5d6e")
        
        self.account = Account(client)
    }
    
    public func onRegister(_ email: String, _ password: String) async throws -> User<[String: AnyCodable]>{
        try await account.create(userId: ID.unique(), email: email, password: password)
    }
    
    public func onLogin(_ email: String, _ password: String) async throws -> Session{
        try await account.createEmailPasswordSession(email: email, password: password)
    }
    
    public func onLogout() async throws {
        _ = try await account.deleteSession(sessionId: "current")
    }
}

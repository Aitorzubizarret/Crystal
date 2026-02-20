//
//  PhotoPrismAPIClient.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 19/2/26.
//

import Foundation
import Combine

class PhotoPrismAPIClient: ObservableObject {
    
    // MARK: - Properties
    
    @Published var session: Bool = false
    
    // MARK: - Methods
    
    func fetchUserSession(url: String, username: String, userpassword: String) async throws {
        let fullUrl: String = "\(url)/api/v1/session"
        
        guard let validURL = URL(string: fullUrl) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: validURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: String] = ["username": username, "password": userpassword]
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonData
        
        let (data, respose) = try await URLSession.shared.data(for: request)
        
        let decodedData = try JSONDecoder().decode(PhotoPrismSessionResponse.self, from: data)
        print(decodedData)
        
        session = true
    }
    
}

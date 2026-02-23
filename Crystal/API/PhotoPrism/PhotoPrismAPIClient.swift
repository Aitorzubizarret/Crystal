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
    
    @Published var activeSession: PhotoPrismActiveSession? = nil
    
    enum SERVICE_URL: String {
        case SESSION = "/api/v1/session"
    }
    
    // MARK: - Methods
    
    /// Deletes the 'activeSession'
    private func deleteActiveSession() {
        activeSession = nil
    }
}

// MARK: - Session Methods

extension PhotoPrismAPIClient {
    
    /// Fetches the user's session.
    /// Similar to Log in with 'username' and 'password'.
    func fetchUserSession(url: String, username: String, userpassword: String) async throws {
        let fullUrl: String = "\(url)\(SERVICE_URL.SESSION.rawValue)"
        
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
        
        activeSession = PhotoPrismActiveSession(id: decodedData.id,
                                                sessionId: decodedData.sessionId,
                                                accessToken: decodedData.accessToken,
                                                expiresIn: decodedData.expiresIn,
                                                downloadToken: decodedData.config.downloadToken,
                                                previewToken: decodedData.config.previewToken,
                                                baseURL: url)
        
        if let activeSession = activeSession {
            saveActiveSessionInKeychain(activeSession: activeSession)
        }
    }
    
    /// Deletes the user's session.
    func deleteUserSession() async throws {
        guard let activeSession = activeSession else { return }
        
        let fullUrl: String = "\(activeSession.baseURL)\(SERVICE_URL.SESSION.rawValue)?id=\(activeSession.sessionId)"
        
        guard let validURL = URL(string: fullUrl) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: validURL)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(activeSession.accessToken)", forHTTPHeaderField: "X-Auth-Token")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Print raw data as String
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON: \(jsonString)")
        }
        
        let sessionDeleteResponse = try JSONDecoder().decode(PhotoPrismSessionDeleteResponse.self, from: data)
        print(sessionDeleteResponse)
        
        if sessionDeleteResponse.isDeleted() {
            deleteActiveSessionInKeychain(activeSession: activeSession)
            
            deleteActiveSession()
        }
        
    }
    
}

// MARK: - Keychain Methods

extension PhotoPrismAPIClient {
    
    /// Saves the ActiveSession in Keychain.
    private func saveActiveSessionInKeychain(activeSession: PhotoPrismActiveSession) {
        if !KeychainManager().saveActiveSession(activeSession: activeSession) {
            print("Error saving the ActiveSession in Keychain")
            // TODO: ¿Display an alert view?
        }
    }
    
    /// Deletes the ActiveSession from the Keychain.
    private func deleteActiveSessionInKeychain(activeSession: PhotoPrismActiveSession) {
        if !KeychainManager().deleteActiveSession() {
            print("Error deleting the ActiveSession from the Keychain")
            // TODO: ¿Display an alert view?
        }
    }
    
}

// MARK: - Album Methods

extension PhotoPrismAPIClient {
 
    /// Fetches albums data.
    func fetchAlbums(activeSession: PhotoPrismActiveSession, albumNumber: Int) async throws {
        let fullUrl: String = "\(activeSession.baseURL)/api/v1/albums?count=\(albumNumber)"
        
        guard let validURL = URL(string: fullUrl) else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: validURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("\(activeSession.accessToken)", forHTTPHeaderField: "X-Auth-Token")
        
        let (data, respose) = try await URLSession.shared.data(for: request)
        
        // Print raw data as String
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Raw JSON: \(jsonString)")
        }
        
        let decodedData = try JSONDecoder().decode([PhotoPrismAlbumResponse].self, from: data)
        print(decodedData)
    }
    
}

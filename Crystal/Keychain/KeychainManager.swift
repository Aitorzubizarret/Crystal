//
//  KeychainManager.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 23/2/26.
//

import Foundation

class KeychainManager {
    
    // MARK: - Properties
    
    private let SERVICE_NAME: String = "eus.aitorzubizarreta.crystal"
    
    enum ACCOUNT_NAME: String {
        case ACTIVE_SESSION = "activeSession"
    }
    
    enum KeychainError: Error {
        case duplicateItem
        case itemNotFound
        case unexpectedStatus(OSStatus)
        case invalidData
    }
    
    // MARK: - Methods
    
    // Save
    func save(data: Data, account: ACCOUNT_NAME) throws {
        // Query dictionary with required attributes.
        let query: [String: Any] = [
            /// Generic Password = token
            kSecClass as String: kSecClassGenericPassword,
            
            /// Account name = key identifier
            kSecAttrAccount as String: account.rawValue,
            
            /// Service name = organize items
            kSecAttrService as String: SERVICE_NAME,
            
            /// Data to store (Data type)
            kSecValueData as String: data
        ]
        
        // Try add the item to the Keychain.
        let status = SecItemAdd(query as CFDictionary, nil)
        
        // Handle the result.
        switch status {
        case errSecSuccess:
            return
        case errSecDuplicateItem:
            throw KeychainError.duplicateItem
        default:
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    // Retrieve
    func retrieve(account: ACCOUNT_NAME) throws -> Data? {
        // Query dictionary with required attributes.
        let query: [String: Any] = [
            /// Generic Password = token
            kSecClass as String: kSecClassGenericPassword,
            
            /// Account name = key identifier
            kSecAttrAccount as String: account.rawValue,
            
            /// Service name = organize items
            kSecAttrService as String: SERVICE_NAME,
            
            /// Request to return the data
            kSecReturnData as String: true,
            
            /// Only return one item
            kSecMatchLimit as String: kSecMatchLimitOne
            
        ]
        
        // To hold the retrieved item
        var result: AnyObject?
        
        // Try get item from Keychain.
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        // Handle the result.
        switch status {
        case errSecSuccess:
            return result as? Data
        case errSecItemNotFound:
            return nil
        default:
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    // Update
    
    // Delete
    func delete(account: ACCOUNT_NAME) throws {
        // Query dictionary with required attributes.
        let query: [String: Any] = [
            /// Generic Password = token
            kSecClass as String: kSecClassGenericPassword,
            
            /// Account name = key identifier
            kSecAttrAccount as String: account.rawValue,
            
            /// Service name = organize items
            kSecAttrService as String: SERVICE_NAME
        ]
        
        // Try delete the item from Keychain.
        let status = SecItemDelete(query as CFDictionary)
        
        // Handle the result.
        switch status {
        case errSecSuccess, errSecItemNotFound:
            return
        default:
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
}

// MARK: - ActiveSession

extension KeychainManager {
    
    /// Saves the ActiveSession in the Keychain.
    func saveActiveSession(activeSession: PhotoPrismActiveSession) -> Bool {
        do {
            let activeSessionData = try JSONEncoder().encode(activeSession)
            try KeychainManager().save(data: activeSessionData, account: .ACTIVE_SESSION)
            
            return true
        } catch let error {
            print("KeychainManager.saveActiveSession - Error \(error)")
        }
        
        return false
    }
    
    /// Retrieves the ActiveSession if exists in the Keychain, otherwise nil.
    func retrieveActiveSession() -> PhotoPrismActiveSession? {
        if let activeSessionData = try? retrieve(account: .ACTIVE_SESSION),
           let activeSession = try? JSONDecoder().decode(PhotoPrismActiveSession.self, from: activeSessionData) {
            return activeSession
        } else {
            return nil
        }
    }
    
    /// Deletes the ActiveSession from the Keychain.
    func deleteActiveSession() -> Bool {
        do {
            try delete(account: .ACTIVE_SESSION)
            
            return true
        } catch let error {
            print("KeychainManager.deleteActiveSession - Error \(error)")
        }
        
        return false
    }
    
}

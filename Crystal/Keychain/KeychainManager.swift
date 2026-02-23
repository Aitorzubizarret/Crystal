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
    
    enum KeychainAccount: String {
        case token = "token"
    }
    
    enum KeychainError: Error {
        case duplicateItem
        case itemNotFound
        case unexpectedStatus(OSStatus)
        case invalidData
    }
    
    // MARK: - Methods
    
    // Save
    func save(data: Data, account: KeychainAccount) throws {
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
    func retrieve(account: KeychainAccount) throws -> Data? {
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
    func delete(account: KeychainAccount) throws {
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

//
//  PhotoPrismSessionDeleteResponse.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 23/2/26.
//

import Foundation

struct PhotoPrismSessionDeleteResponse: Codable {
    let sessionId: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
        case status
    }
    
    func isDeleted() -> Bool {
        if status == "deleted" {
            return true
        } else {
            return false
        }
    }
}

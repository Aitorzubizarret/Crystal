//
//  PhotoPrismActiveSession.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 21/2/26.
//

import Foundation

struct PhotoPrismActiveSession: Codable {
    let id: String
    let sessionId: String
    let accessToken: String
    let expiresIn: Double
    let downloadToken: String
    let previewToken: String
    let baseURL: String
}

extension PhotoPrismActiveSession: Equatable {
    static func == (lhs: PhotoPrismActiveSession, rhs: PhotoPrismActiveSession) -> Bool {
        return (lhs.id == rhs.id &&
                lhs.sessionId == rhs.sessionId &&
                lhs.accessToken == rhs.accessToken &&
                lhs.expiresIn == rhs.expiresIn &&
                lhs.downloadToken == rhs.downloadToken &&
                lhs.previewToken == rhs.previewToken &&
                lhs.baseURL == rhs.baseURL)
    }
}

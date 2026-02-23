//
//  PhotoPrismAlbumResponse.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 21/2/26.
//

import Foundation

struct PhotoPrismAlbumResponse: Codable {
    let uid: String
    let parentUid: String
    let thumb: String
    let slug: String
    let type: String
    let title: String
    let location: String
    let category: String
    let caption: String
    let description: String
    let notes: String
    let filter: String
    let order: String
    let template: String
    let path: String
    let state: String
    let country: String
    let year: Int
    let month: Int
    let day: Int
    let favorite: Bool
    let isPrivate: Bool
    let photoCount: Int
    let linkCount: Int
    let createdAt: String
    let updatedAt: String
    let deletedAt: String
    
    enum CodingKeys: String, CodingKey {
        case uid = "UID"
        case parentUid = "ParentUID"
        case thumb = "Thumb"
        case slug = "Slug"
        case type = "Type"
        case title = "Title"
        case location = "Location"
        case category = "Category"
        case caption = "Caption"
        case description = "Description"
        case notes = "Notes"
        case filter = "Filter"
        case order = "Order"
        case template = "Template"
        case path = "Path"
        case state = "State"
        case country = "Country"
        case year = "Year"
        case month = "Month"
        case day = "Day"
        case favorite = "Favorite"
        case isPrivate = "Private"
        case photoCount = "PhotoCount"
        case linkCount = "LinkCount"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
        case deletedAt = "DeletedAt"
    }
}



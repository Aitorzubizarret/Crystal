//
//  PhotoPrismSessionResponse.swift
//  Crystal
//
//  Created by Aitor Zubizarreta on 20/2/26.
//

import Foundation

// MARK: - PhotoPrismSessionResponse

struct PhotoPrismSessionResponse: Codable {
    let accessToken: String
    let config: PhotoPrismSessionConfig
    let data: PhotoPrismSessionData
    let expiresIn: Double
    let id: String
    let provider: String
    let scope: String?
    let sessionId: String
    let status: String
    let tokenType: String
    let user: PhotoPrismSessionUser
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case config
        case data
        case expiresIn = "expires_in"
        case id
        case provider
        case scope
        case sessionId = "session_id"
        case status
        case tokenType = "token_type"
        case user
    }
}

// ///////////////////////////////
// MARK: - PhotoPrismSessionConfig
// ///////////////////////////////

struct PhotoPrismSessionConfig: Codable {
    let mode: String
    let name: String
    let about: String
    let edition: String
    let version: String
    let copyright: String
    let flags: String
    let baseUri: String
    let staticUri: String
    let cssUri: String
    let jsUri: String
    let manifestUri: String
    let apiUri: String
    let contentUri: String
    let videoUri: String
    let wallpaperUri: String
    let siteUrl: String
    let siteDomain: String
    let siteAuthor: String
    let siteTitle: String
    let siteCaption: String
    let siteDescription: String
    let sitePreview: String
    let legalInfo: String
    let legalUrl: String
    let appName: String
    let appMode: String
    let appIcon: String
    let appColor: String
    let restart: Bool
    let debug: Bool
    let trace: Bool
    let test: Bool
    let demo: Bool
    let sponsor: Bool
    let readonly: Bool
    let uploadNSFW: Bool
    let isPublic: Bool // public
    let authMode: String
    let usersPath: String
    let loginUri: String
    let registerUri: String
    let passwordLength: Int
    let passwordResetUri: String
    let develop: Bool
    let experimental: Bool
    //let albumCategories: [SessionConfigAlbumCategory]
    let albums: [SessionConfigAlbum?]
    let cameras: [SessionConfigCameraLens?]
    let lenses: [SessionConfigCameraLens?]
    let countries: [SessionConfigCountry?]
    let people: [SessionConfigPeople?]
    let thumbs: [SessionConfigThumb?]
    let tier: Int
    let membership: String
    let customer: String
    let mapKey: String
    let downloadToken: String
    let previewToken: String
    let disable: SessionConfigDisable
    let count: SessionConfigCount
    let pos: SessionConfigPos
    let years: [Int]
    let colors: [SessionConfigColor]
    let categories: [SessionConfigCategory]
    let clip: Int
    let server: SessionConfigServer
    let settings: SessionConfigSettings
    let acl: SessionConfigAcl
    let ext: SessionConfigExt
    
    enum CodingKeys: String, CodingKey {
        case mode
        case name
        case about
        case edition
        case version
        case copyright
        case flags
        case baseUri
        case staticUri
        case cssUri
        case jsUri
        case manifestUri
        case apiUri
        case contentUri
        case videoUri
        case wallpaperUri
        case siteUrl
        case siteDomain
        case siteAuthor
        case siteTitle
        case siteCaption
        case siteDescription
        case sitePreview
        case legalInfo
        case legalUrl
        case appName
        case appMode
        case appIcon
        case appColor
        case restart
        case debug
        case trace
        case test
        case demo
        case sponsor
        case readonly
        case uploadNSFW
        case isPublic = "public"
        case authMode
        case usersPath
        case loginUri
        case registerUri
        case passwordLength
        case passwordResetUri
        case develop
        case experimental
        //case albumCategories
        case albums
        case cameras
        case lenses
        case countries
        case people
        case thumbs
        case tier
        case membership
        case customer
        case mapKey
        case downloadToken
        case previewToken
        case disable
        case count
        case pos
        case years
        case colors
        case categories
        case clip
        case server
        case settings
        case acl
        case ext
    }
}

// MARK: - SessionConfig AlbumCategories

struct SessionConfigAlbumCategory: Codable {}

// MARK: - SessionConfig Album

struct SessionConfigAlbum: Codable {}

// MARK: - SessionConfig Cameras/Lenses

struct SessionConfigCameraLens: Codable {
    let id: Int
    let slug: String
    let name: String
    let make: String
    let model: String
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case slug = "Slug"
        case name = "Name"
        case make = "Make"
        case model = "Model"
        case type = "Type"
    }
}

// MARK: - SessionConfig Country

struct SessionConfigCountry: Codable {
    let id: String
    let slug: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case slug = "Slug"
        case name = "Name"
    }
}

// MARK: - SessionConfig People

struct SessionConfigPeople: Codable {
    let uid: String
    let name: String
    let keywords: [String]
    
    enum CodingKeys: String, CodingKey {
        case uid = "UID"
        case name = "Name"
        case keywords = "Keywords"
    }
}

// MARK: - SessionConfig Thumb

struct SessionConfigThumb: Codable {
    let size: String
    let usage: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case size
        case usage
        case width = "w"
        case height = "h"
    }
}

// MARK: - SessionConfig Disable

struct SessionConfigDisable: Codable {
    let restart: Bool
    let webdav: Bool
    let settings: Bool
    let places: Bool
    let backups: Bool
    let tensorflow: Bool
    let faces: Bool
    let classification: Bool
    let ffmpeg: Bool
    let exiftool: Bool
    let vips: Bool
    let sips: Bool
    let darktable: Bool
    let rawtherapee: Bool
    let imagemagick: Bool
    let heifconvert: Bool
    let vectors: Bool
    let jpegxl: Bool
    let raw: Bool
}

// MARK: - SessionConfig Count

struct SessionConfigCount: Codable {
    let all: Int
    let photos: Int
    let live: Int
    let videos: Int
    let cameras: Int
    let lenses: Int
    let countries: Int
    let hidden: Int
    let archived: Int
    let favorites: Int
    let review: Int
    let stories: Int
    let howManyPrivate: Int
    let albums: Int
    let privateAlbums: Int
    let moments: Int
    let privateMoments: Int
    let months: Int
    let privateMonths: Int
    let states: Int
    let privateStates: Int
    let folders: Int
    let privateFolders: Int
    let files: Int
    let people: Int
    let places: Int
    let labels: Int
    let labelMaxPhotos: Int
    
    enum CodingKeys: String, CodingKey {
        case all
        case photos
        case live
        case videos
        case cameras
        case lenses
        case countries
        case hidden
        case archived
        case favorites
        case review
        case stories
        case howManyPrivate = "private"
        case albums
        case privateAlbums = "private_albums"
        case moments
        case privateMoments = "private_moments"
        case months
        case privateMonths = "private_months"
        case states
        case privateStates = "private_states"
        case folders
        case privateFolders = "private_folders"
        case files
        case people
        case places
        case labels
        case labelMaxPhotos
    }
}

// MARK: - SessionConfig Pos

struct SessionConfigPos: Codable {
    let uid: String
    let cid: String
    let utc: String
    let lat: Double
    let lng: Double
}

// MARK: - SessionConfig Color

struct SessionConfigColor: Codable {
    let example: String
    let name: String
    let slug: String
    
    enum CodingKeys: String, CodingKey {
        case example = "Example"
        case name = "Name"
        case slug = "Slug"
    }
}

// MARK: - SessionConfig Category

struct SessionConfigCategory: Codable {
    let uid: String
    let slug: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case uid = "UID"
        case slug = "Slug"
        case name = "Name"
    }
}

// MARK: - SessionConfig Server

struct SessionConfigServer: Codable {
    let cores: Int
    let routines: Int
    let memory: SessionConfigServerMemory
}

// MARK: - SessionConfig Server Memory

struct SessionConfigServerMemory: Codable {
    let total: Double
    let free: Double
    let used: Double
    let reserved: Double
    let info: String
}

// MARK: - SessionConfig Settings

struct SessionConfigSettings: Codable {}

// UI

// Search

// Maps

// Features

// Import

// Index

// Stack

// Share

// Download

// Templates

// MARK: - SessionConfig ACL

struct SessionConfigAcl: Codable {
    
}

// Albums

// Calendar

// Config

// Default

// Favorites

// Feedback

// Files

// Folders

// Labels

// Logs

// Metrics

// Moments

// Passcode

// Password

// People

// Photos

// Places

// Services

// Sessions

// Settings

// Shares

// Users

// Videos

// WebDAV

// MARK: - SessionConfig Ext

struct SessionConfigExt: Codable {
    let oidc: SessionConfigExtOidc
    let plus: SessionConfigExtPlus
}

// MARK: - SessionConfig Ext OIDC

struct SessionConfigExtOidc: Codable {
    let enabled: Bool
    let icon: String
    let loginUri: String
    let provider: String
    let redirect: Bool
    let register: Bool
}

// MARK: - SessionConfig Ext Plus

struct SessionConfigExtPlus: Codable {}

// /////////////////////////////
// MARK: - PhotoPrismSessionData
// /////////////////////////////

struct PhotoPrismSessionData: Codable {
    let tokens: String?
    let shares: String?
}

// /////////////////////////////
// MARK: - PhotoPrismSessionUser
// /////////////////////////////

struct PhotoPrismSessionUser: Codable {
    let id: Int
    let uid: String
    let authProvider: String
    let authMethod: String
    let authID: String
    let name: String
    let displayName: String
    let email: String
    let role: String
    let attr: String
    let superAdmin: Bool
    let canLogin: Bool
    let loginAt: String
    let webDAV: Bool
    let basePath: String
    let uploadPath: String
    let canInvite: Bool
    let details: PhotoPrismSessionUserDetails
    let settings: PhotoPrismSessionUserSettings
    let thumb: String
    let thumbSrc: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case uid = "UID"
        case authProvider = "AuthProvider"
        case authMethod = "AuthMethod"
        case authID = "AuthID"
        case name = "Name"
        case displayName = "DisplayName"
        case email = "Email"
        case role = "Role"
        case attr = "Attr"
        case superAdmin = "SuperAdmin"
        case canLogin = "CanLogin"
        case loginAt = "LoginAt"
        case webDAV = "WebDAV"
        case basePath = "BasePath"
        case uploadPath = "UploadPath"
        case canInvite = "CanInvite"
        case details = "Details"
        case settings = "Settings"
        case thumb = "Thumb"
        case thumbSrc = "ThumbSrc"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
    }
}

// MARK:  User Details

struct PhotoPrismSessionUserDetails: Codable {
    let birthyear: Int
    let birthMonth: Int
    let birthDay: Int
    let nameTitle: String
    let givenName: String
    let middleName: String
    let familyName: String
    let nameSuffix: String
    let nickName: String
    let nameSrc: String
    let gender: String
    let about: String
    let bio: String
    let location: String
    let country: String
    let phone: String
    let siteUrl: String
    let profileUrl: String
    let orgTitle: String
    let orgName: String
    let orgEmail: String
    let orgPhone: String
    let orgUrl: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case birthyear = "BirthYear"
        case birthMonth = "BirthMonth"
        case birthDay = "BirthDay"
        case nameTitle = "NameTitle"
        case givenName = "GivenName"
        case middleName = "MiddleName"
        case familyName = "FamilyName"
        case nameSuffix = "NameSuffix"
        case nickName = "NickName"
        case nameSrc = "NameSrc"
        case gender = "Gender"
        case about = "About"
        case bio = "Bio"
        case location = "Location"
        case country = "Country"
        case phone = "Phone"
        case siteUrl = "SiteURL"
        case profileUrl = "ProfileURL"
        case orgTitle = "OrgTitle"
        case orgName = "OrgName"
        case orgEmail = "OrgEmail"
        case orgPhone = "OrgPhone"
        case orgUrl = "OrgURL"
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
    }
}


// MARK:  User Settings

struct PhotoPrismSessionUserSettings: Codable {
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "CreatedAt"
        case updatedAt = "UpdatedAt"
    }
}

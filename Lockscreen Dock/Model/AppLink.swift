//
//  AppLink.swift
//  Lockscreen Dock
//
//  Created by Sam Prince K on 11/12/22.
//

import SwiftUI

struct Applink: Identifiable,Equatable,Codable,Hashable{
    var id: UUID = .init()
    var name: String
    var deepLink: String
    var status: Bool = false
    var appURL: URL?
    
    enum CodingKeys: CodingKey{
        case id
        case name
        case deepLink
        case status
        case appURL
    }
}

//MARK: Sample Links
var appLinks: [Applink] = [
    .init(name: "Google", deepLink: "https://www.google.com"),
    .init(name: "Google Maps", deepLink: "comgooglemaps://"),
    .init(name: "YouTube", deepLink: "youtube://"),
    .init(name: "Google Translate", deepLink: "googleTranslate://"),
    .init(name: "Shortcuts", deepLink: "shortcuts://")
]

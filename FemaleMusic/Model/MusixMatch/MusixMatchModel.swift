//
//  MusixMatchModel.swift
//  FemaleMusic
//
//  Created by Ferdinand on 10/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import Foundation

struct MusixMatchModel: Codable {
    let message: Message
}

struct Message: Codable {
    let header: Header
    let body: Body
}

struct Header: Codable {
    let statusCode: Int
    let executeTime: Double
    let available: Int
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case executeTime = "execute_time"
        case available = "available"
    }
}

struct Body: Codable {
    let trackListModel: [TrackListModel]
    
    enum CodingKeys: String, CodingKey {
        case trackListModel = "track_list"
    }
}

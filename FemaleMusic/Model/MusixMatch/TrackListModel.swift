//
//  TrackListModel.swift
//  FemaleMusic
//
//  Created by Ferdinand on 11/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import Foundation

struct TrackListModel: Codable {
    let track: Track
}

struct Track: Codable {
    let trackID: Int
    let trackName: String
    //    let trackNameTranslationList: [JSONAny]
    let trackRating, commontrackID, instrumental, explicit: Int
    let hasLyrics, hasSubtitles, hasRichsync, numFavourite: Int
    let albumID: Int
    let albumName: String
    let artistID: Int
    let artistName: String
    let trackShareURL, trackEditURL: String
    let restricted: Int
    let updatedTime: String
    let primaryGenres: PrimaryGenres
    
    enum CodingKeys: String, CodingKey {
        case trackID = "track_id"
        case trackName = "track_name"
        //        case trackNameTranslationList = "track_name_translation_list"
        case trackRating = "track_rating"
        case commontrackID = "commontrack_id"
        case instrumental, explicit
        case hasLyrics = "has_lyrics"
        case hasSubtitles = "has_subtitles"
        case hasRichsync = "has_richsync"
        case numFavourite = "num_favourite"
        case albumID = "album_id"
        case albumName = "album_name"
        case artistID = "artist_id"
        case artistName = "artist_name"
        case trackShareURL = "track_share_url"
        case trackEditURL = "track_edit_url"
        case restricted = "restricted"
        case updatedTime = "updated_time"
        case primaryGenres = "primary_genres"
    }
}

struct PrimaryGenres: Codable {
    let musicGenreList: [MusicGenreList]
    
    enum CodingKeys: String, CodingKey {
        case musicGenreList = "music_genre_list"
    }
}

struct MusicGenreList: Codable {
    let musicGenre: MusicGenre
    
    enum CodingKeys: String, CodingKey {
        case musicGenre = "music_genre"
    }
}

struct MusicGenre: Codable {
    let musicGenreID, musicGenreParentID: Int
    let musicGenreName, musicGenreNameExtended, musicGenreVanity: String
    
    enum CodingKeys: String, CodingKey {
        case musicGenreID = "music_genre_id"
        case musicGenreParentID = "music_genre_parent_id"
        case musicGenreName = "music_genre_name"
        case musicGenreNameExtended = "music_genre_name_extended"
        case musicGenreVanity = "music_genre_vanity"
    }
}

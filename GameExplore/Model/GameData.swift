//
//  GameData.swift
//  GamExplore
//
//  Created by Thibaud DORR on 14/09/2023.
//

import Foundation

let defaultGame = Game(
    slug: nil,
    name: "None name for this game yet this is only test",
    short_screenshots: nil,
    playtime: nil,
    platforms: nil,
    stores: nil,
    released: nil,
    tba: nil,
    background_image: nil,
    rating: nil,
    rating_top: nil,
    ratings: nil,
    ratings_count: nil,
    reviews_text_count: nil,
    added: nil,
    metacritic: nil,
    score: ""
)

struct GameResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Game]
}

struct Game: Decodable {
    let slug: String?
    let name: String
    let short_screenshots: [Short_screenshots]?
    let playtime: Int?
    let platforms: [PlatformInfo]?
    let stores: [StoreInfo]?
    let released: String?
    let tba: Bool?
    let background_image: String?
    let rating: Double?
    let rating_top: Int?
    let ratings: [Rating]?
    let ratings_count: Int?
    let reviews_text_count: Int?
    let added: Int?
    let metacritic: Int?
    let score: String?
}

struct PlatformInfo: Decodable {
    let platform: Platform?
}

struct Short_screenshots: Decodable {
    let id: Int?
    let image: String?
}

struct Platform: Decodable {
    let id: Int?
    let name: String?
    let slug: String?
}

struct StoreInfo: Decodable {
    let store: Store?
}

struct Store: Decodable {
    let id: Int?
    let name: String?
    let slug: String?
}

struct Rating: Decodable {
        let id: Int?
        let title: String?
        let count: Int?
        let percent: Double?
}

struct Tag: Decodable {
       let id: Int?
       let name: String?
       let slug: String?
       let language: String?
       let games_count: Int?
       let image_background: String?
}

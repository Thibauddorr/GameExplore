//
//  NetworkManager.swift
//  GameExplore
//
//  Created by Thibaud DORR on 14/09/2023.
//
// API KEY : f652a2ffe55f46e58d01d2cd2dddcc8c

import Foundation

class NetworkManager {
    var searchGames: [Game] = []

    func fetchGame(gameTitle: String, completion: @escaping ([Game]) -> Void) {
        let encodedGameTitle = gameTitle.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let APIurl = "https://api.rawg.io/api/games?search=\(encodedGameTitle)&key=f652a2ffe55f46e58d01d2cd2dddcc8c"
        
        performRequest(urlString: APIurl) { [weak self] gameData in
            self?.searchGames = self?.parseJSON(gameData: gameData) ?? []
            completion(self?.searchGames ?? []) // Notify that data is ready
        }
    }
    
    func performRequest(urlString: String, completion: @escaping (Data) -> Void) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                if let safeData = data {
                    completion(safeData)
                }
            }
            task.resume()
        }
    }

    func parseJSON(gameData: Data) -> [Game] {
        var games: [Game] = []
        print("Parsing JSON")
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(GameResponse.self, from: gameData)
            for game in decodedData.results {
                print("Game Name: \(game.name)")
                games.append(game)
            }
        } catch {
            print("Error parsing JSON: \(error)")
        }
        return games
    }
    
    func clearSearchResults() {
        searchGames = []
    }
}

//
//  MovieRepository.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 06/12/21.
//

import Foundation

class MovieRepository {
    
    func getTopMovies(_ completionHandler: @escaping ([Movie]) -> Void) {
        if let requestURL = URL(string: "\(GlobalConstants.TheMovieDatabase.theMovieDatabaseURL)?api_key=\(GlobalConstants.TheMovieDatabase.apiKey)&language=es-MX&page=1") {
            var request = URLRequest(url: requestURL)
            request.httpMethod = GlobalConstants.TheMovieDatabase.httpMethod
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                if let error = error {
                    print("Error fetching movies: \(error)")
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let response = try JSONDecoder().decode(MovieList.self, from: data)
                    completionHandler(response.results)
                } catch {
                    print("Error decoding movies: \(error)")
                    return
                }
            }.resume()
        }
    }
}

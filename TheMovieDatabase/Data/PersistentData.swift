//
//  PersistentData.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 09/12/21.
//

import Foundation

struct PersistentData {
    
    func saveMovies(movies: [Movie]) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Movies.plist")
        
        do {
            let data = try encoder.encode(movies)
            try data.write(to: path)
        } catch {
            print(error)
        }
    }
    
    func getMovies() {
        if let path = Bundle.main.path(forResource: "Movies", ofType: "plist"),
           let xml = FileManager.default.contents(atPath: path),
           let movies = try? PropertyListDecoder().decode(Movie.self, from: xml)
        {
            //print(preferences.webserviceURL)
        }
    }
}

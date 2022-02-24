//
//  APICaller.swift
//  News-App
//
//  Created by mogggiii on 23.02.2022.
//

import Foundation

final class APICaller {
	
	static let shared = APICaller()
	static let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(APIKey)")
	static let APIKey = "ab9a5bc74e4a4cf9bf87620d6b0e533d"
	
	
	private init () {}
	
	public func getTopStories(completion: @escaping(Result<[Article], Error>) -> Void) {
		guard let url = APICaller.url else { return }
		
		URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				completion(.failure(error))
			} else if let data = data {
				do {
					let result = try JSONDecoder().decode(NewsModel.self, from: data)
					print("Arcticles: \(result.articles.count)")
					completion(.success(result.articles))
				} catch {
					completion(.failure(error))
				}
			}
		} .resume()
		
	}
	
}

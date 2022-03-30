//
//  APICaller.swift
//  News-App
//
//  Created by mogggiii on 23.02.2022.
//

import Foundation

final class APICaller {
	
	static let APIKey = "ab9a5bc74e4a4cf9bf87620d6b0e533d"
	static let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(APIKey)")
	
	private init () {}
	
}

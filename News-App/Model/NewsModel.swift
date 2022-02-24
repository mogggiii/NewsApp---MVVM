//
//  NewsModel.swift
//  News-App
//
//  Created by mogggiii on 23.02.2022.
//

import Foundation

struct NewsModel: Decodable {
	let articles: [Article]
}

struct Article: Decodable {
	let source: Source
	let title: String
	let description: String?
	let url: String?
	let urlToImage: String?
	let publishedAt: String?
}

struct Source: Decodable {
	let name: String
}

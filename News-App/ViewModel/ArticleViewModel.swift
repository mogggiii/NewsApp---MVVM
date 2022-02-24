//
//  ArticleViewModel.swift
//  News-App
//
//  Created by mogggiii on 24.02.2022.
//

import Foundation

struct ArticleViewModel {
	
	private let article: Article
	
	var title: String {
		return article.title
	}
	
	var description: String {
		return article.description ?? "No Description"
	}
	
	init(article: Article) {
		self.article = article
	}
	
}

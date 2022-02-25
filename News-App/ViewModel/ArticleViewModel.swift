//
//  ArticleViewModel.swift
//  News-App
//
//  Created by mogggiii on 24.02.2022.
//

import Foundation
import UIKit

struct ArticleViewModel: ArticleViewModelType {
	
	private let article: Article
	
	var title: String {
		return article.title
	}
	
	var description: String {
		return article.description ?? "No Description"
	}
	
	var imageURL: URL? {
		let imageUrl = URL(string: article.urlToImage ?? "NO")
		return imageUrl
	}
	
	init(article: Article) {
		self.article = article
	}
	
}

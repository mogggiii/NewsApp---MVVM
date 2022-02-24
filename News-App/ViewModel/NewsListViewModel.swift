//
//  ViewModel.swift
//  News-App
//
//  Created by mogggiii on 23.02.2022.
//

import Foundation

struct NewsListViewModel {
	
	var articles: [Article]
	
	func numberOfRows() -> Int {
		return self.articles.count
	}
	
	func articleAtIndex(_ index: Int) -> ArticleViewModel {
		let article = articles[index]
		
		return ArticleViewModel(article: article)
	}
	
	func selectRow(atIndexPath indexPath: IndexPath) {
		print("no")
	}
	
	

}

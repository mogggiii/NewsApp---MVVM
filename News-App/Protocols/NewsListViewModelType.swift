//
//  NewsListViewModelType.swift
//  News-App
//
//  Created by mogggiii on 24.02.2022.
//

import Foundation
 
protocol NewsListViewModelType {
	func numberOfRows() -> Int
	func articleAtIndex(_ index: Int) -> ArticleViewModelType
	func didSelectArticle(_ index: Int) -> Article
}

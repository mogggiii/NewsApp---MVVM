//
//  AlamofireNetworkManager.swift
//  News-App
//
//  Created by mogggiii on 24.02.2022.
//

import Foundation
import Alamofire

final class AlamofireNetworkManager {
	
	static let shared = AlamofireNetworkManager()
	
	private init () {}
	
	//MARK: - Get News
	public func getTopStories(completion: @escaping([Article]?, Error?) -> Void) {
		guard let url = APICaller.url else { return }
		
		AF.request(url).responseDecodable(of: NewsModel.self) { response in
			switch response.result {
			case .success(let data):
				print(data.articles.count)
				completion(data.articles, nil)
			case.failure(let error):
				completion(nil, error)
			}
		}
	}
	
}


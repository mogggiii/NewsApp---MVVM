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
	
	//MARK: - Get Image
	public func fetchImage(url: URL?, completion: @escaping(UIImage?) -> ()) {
		
		guard let url = url else { return }
		
		AF.request(url).responseData { response in
			switch response.result {
			case .success(let data):
				DispatchQueue.global().async {
					completion(UIImage(data: data))
				}
			case .failure(_):
				completion(UIImage(named: "placeholder"))
			}
		}
	}
	
}


//
//  NewsTableViewController.swift
//  News-App
//
//  Created by mogggiii on 23.02.2022.
//

import UIKit

class NewsViewController: UITableViewController {
	
	private let cellId = "cell"
	private var viewModel: NewsListViewModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "News"
		navigationController?.navigationBar.prefersLargeTitles = true
		
		tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: cellId)
		
		fetchNews()
	}
	
	private func fetchNews() {
		APICaller.shared.getTopStories { [weak self] result in
			switch result {
			case .success(let articles):
				self?.viewModel = NewsListViewModel(articles: articles)
				DispatchQueue.main.async {
					self?.tableView.reloadData()
				}
			case .failure(let error):
				print(error)
			}
		}
	}

	//MARK: - Table View Data Source 
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	viewModel?.numberOfRows() ?? 0
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
	guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? NewsTableViewCell else { fatalError("TableViewCell no found") }
	
	let newsListVM = (self.viewModel?.articleAtIndex(indexPath.row))!
	
	cell.configure(with: newsListVM)
	return cell
	
		}
	}

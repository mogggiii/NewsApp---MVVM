//
//  NewsTableViewController.swift
//  News-App
//
//  Created by mogggiii on 23.02.2022.
//

import UIKit
import SafariServices

class NewsViewController: UITableViewController {
	
	lazy var activitiIndicator: UIActivityIndicatorView = {
		let indicator = UIActivityIndicatorView()
		indicator.backgroundColor = .systemBackground
		indicator.frame = CGRect(x: 0.0, y: 0.0, width: 70.0, height: 70.0)
		indicator.style = .large
		indicator.hidesWhenStopped = true
		return indicator
	}()
	
	private let cellId = "cell"
	private var viewModel: NewsListViewModelType?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "News"
		navigationController?.navigationBar.prefersLargeTitles = true

		tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: cellId)
		tableView.backgroundView = activitiIndicator
		
		activitiIndicator.startAnimating()
		
		fetchNews()
	}
	
	override func viewWillAppear(_ animated: Bool) {
			super.viewWillAppear(animated)
			activitiIndicator.center = self.view.center
	}
	
	//MARK: - Private Methods
	private func fetchNews() {
		AlamofireNetworkManager.shared.getTopStories { articles, error in
			self.viewModel = NewsListViewModel(articles: articles ?? [])
			DispatchQueue.main.async {
				self.tableView.reloadData()
				self.activitiIndicator.stopAnimating()
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
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let article = viewModel?.didSelectArticle(indexPath.row)
		
		guard let url = URL(string: article?.url ?? "NO") else { return }
		
		let safariVC = SFSafariViewController(url: url)
		present(safariVC, animated: true)
		
	}
	
}

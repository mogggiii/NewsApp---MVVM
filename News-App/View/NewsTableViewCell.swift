//
//  NewsTableViewCell.swift
//  News-App
//
//  Created by mogggiii on 23.02.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 22, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let subtitleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 15, weight: .light)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let newsImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.clipsToBounds = true
		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = 6
		imageView.contentMode = .scaleAspectFill
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(titleLabel)
		contentView.addSubview(subtitleLabel)
//		contentView.addSubview(newsImageView)
		makeConstraints()
	
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: - Private Methods
	private func makeConstraints() {
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
			titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
			
			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			subtitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
			subtitleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
			subtitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30),
		])
		
		
	}
	
	//MARK: - Configure Cell
	func configure(with viewModel: ArticleViewModelType) {
		
		titleLabel.text = viewModel.title
		subtitleLabel.text = viewModel.description
		
//		if let data = viewModel.imageData {
//			newsImageView.image = UIImage(data: data)
//		} else if let url = viewModel.imageURL {
//			URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//
//				guard let data = data, error == nil else { return }
//
//				viewModel.imageData = data
//				DispatchQueue.main.async {
//					self?.newsImageView.image = UIImage(data: data)
//				}
//			} .resume()
//		}
	}
	
}

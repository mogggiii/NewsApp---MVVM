//
//  NewsTableViewCell.swift
//  News-App
//
//  Created by mogggiii on 23.02.2022.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 22, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var subtitleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 15, weight: .light)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var newsImageView: UIImageView = {
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
		contentView.addSubview(newsImageView)
		makeConstraints()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	//MARK: - Private Methods
	private func makeConstraints() {
	
		NSLayoutConstraint.activate([
			
			//			Image View Constraints
			newsImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
			newsImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
			newsImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -20),
			newsImageView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5),
			
			//Title Constraints
			titleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 16),
			titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
			
			//Descrciption Constraints
			subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			subtitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
			subtitleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
			subtitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
			
		])
	}
	
	//MARK: - Configure Cell
	func configure(with viewModel: ArticleViewModelType) {
		
		titleLabel.text = viewModel.title
		subtitleLabel.text = viewModel.description
		
		guard let imageUrl = viewModel.imageURL else { return }
		
		newsImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"), options: [.continueInBackground])
	}
	
}

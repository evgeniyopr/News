//
//  NewsTableViewCell.swift
//  News
//
//  Created by Evgeniy Opryshko on 13.03.2020.
//  Copyright © 2020 Evgeniy Opryshko. All rights reserved.
//

import UIKit

protocol NewsTableViewCellViewModel {
	var imageUrlString: String { get }
	var title: String { get }
	var description: String? { get }
}

final class NewsTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlets
	
	@IBOutlet weak var pictureView: WebImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	// MARK: - Life Cycle
	
	override func prepareForReuse() {
		
		pictureView.set(imageURL: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		selectionStyle = .none
	}
	
	// MARK: - Configure
	
	func set(viewModel: NewsTableViewCellViewModel) {
		
		self.pictureView.set(imageURL: viewModel.imageUrlString)
		self.titleLabel.text = viewModel.title
		self.descriptionLabel.text = viewModel.description
	}
}

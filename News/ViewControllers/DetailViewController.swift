//
//  DetailViewController.swift
//  News
//
//  Created by Evgeniy Opryshko on 14.03.2020.
//  Copyright © 2020 Evgeniy Opryshko. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	// MARK: - Public properties

	var article: Article?
	
	// MARK: - IBOutlets
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var pictureView: WebImageView!
	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupNavigationBar()
		setInfo()
	}
	
	// MARK: - Private funcs
	
	private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
	
	private func setInfo() {
		
		titleLabel.text = article?.title ?? ""
		pictureView.set(imageURL: article?.urlToImage)
		contentLabel.text = article?.content ?? article?.description
		dateLabel.text = article?.publishedAt?.toString(dateFormat: R.string.constans.detailDateFormat())
	}
}


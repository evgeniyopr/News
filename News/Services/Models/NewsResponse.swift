//
//  NewsResponse.swift
//  News
//
//  Created by Evgeniy Opryshko on 13.03.2020.
//  Copyright © 2020 Evgeniy Opryshko. All rights reserved.
//

import Foundation

// MARK: - NewsResponse

struct NewsResponse: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?

    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}

// MARK: - Article

struct Article: Decodable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: Date?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
}

// MARK: - Source

struct Source: Decodable {
    var id: String?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

// MARK: - NewsFeedViewModel

struct NewsFeedViewModel {
	
	var cells: [Cell]
	
	struct Cell: NewsTableViewCellViewModel {
		
		var imageUrlString: String
		var title: String
		var description: String?
	}
}

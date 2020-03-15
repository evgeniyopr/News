//
//  NetworkDataFetcher.swift
//  News
//
//  Created by Evgeniy Opryshko on 13.03.2020.
//  Copyright © 2020 Evgeniy Opryshko. All rights reserved.
//

import Foundation

protocol DataFetcher {
	func getNews(response: @escaping (NewsResponse?, Error?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
	
	let networking: Networking
	
	init(networking: Networking) {
		self.networking = networking
	}
	
	func getNews(response: @escaping (NewsResponse?, Error?) -> Void) {
		
		let params = ["country": R.string.constans.ua()]
		
		networking.request(path: API.news, params: params) { (data, error) in
			
			if let error = error {
				response(nil, error)
			}
			
			let decoded = self.decodeJSON(type: NewsResponse.self, from: data)
			response(decoded, nil)
		}
	}
	
	private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
		
		guard let data = data else { return nil }
		
		let decoder = JSONDecoder()
		
		let formatter = DateFormatter()
		formatter.dateFormat = R.string.constans.parseDateFormat()
		
		decoder.dateDecodingStrategy = .formatted(formatter)
		
		let response = try? decoder.decode(type.self, from: data)
		
		return response
	}
}

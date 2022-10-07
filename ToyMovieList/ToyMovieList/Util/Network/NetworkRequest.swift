//
//  NetworkRequest.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import Foundation
import Combine

enum NetworkError: Error {
	case request(Error)
	case invalidRequest
}

protocol NetworkRequestable {
	func request() -> AnyPublisher<NetworkResponse, NetworkError>
}

struct NetworkRequest<Item: NetworkResponse>: NetworkRequestable {
	
	let url: URL
	
	private let decoder: JSONDecoder = .init()
	
	init(base baseURL: URL, queries: [String: String]) {
		var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
		urlComponents?.queryItems = queries.map({ URLQueryItem(name: $0, value: $1) })
		self.url = urlComponents?.url ?? URL(fileURLWithPath: "ErrorURL") // TODO: 에러처리 필요
	}
	
	func request() -> AnyPublisher<NetworkResponse, NetworkError>  {
		return URLSession.shared
			.dataTaskPublisher(for: url)
			.map(\.data)
			.decode(type: Item.self, decoder: decoder)
			.mapError({ NetworkError.request($0) })
			.map({ $0 as NetworkResponse })
			.retry(3)
			.eraseToAnyPublisher()
	}
	
}

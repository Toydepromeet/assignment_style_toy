//
//  MockNetworkRequest.swift
//  ToyMovieListTests
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import XCTest
@testable import ToyMovieList

import Combine

struct MockNetworkRequest: NetworkRequestable {
	
	init(base baseURL: URL, queries: [String: String]) { }
	
	func request() -> AnyPublisher<NetworkResponse, NetworkError> {
		Just(DailyBoxOfficeResult(page: .EMPTY))
			.setFailureType(to: Error.self)
			.mapError({ NetworkError.request($0) })
			.eraseToAnyPublisher()
	}
	
}

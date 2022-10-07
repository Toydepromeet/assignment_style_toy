//
//  MockAPI.swift
//  ToyMovieListTests
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import XCTest
@testable import ToyMovieList

import Combine

struct MockAPI: API {
	
	private let baseURL: URL
	private let key: String
	
	init() {
		self.baseURL = URL(fileURLWithPath: "TEST URL")
		self.key = "TEST KEY"
	}
	
	func get(detail: HTTPMethod.GET) -> AnyPublisher<NetworkResponse, NetworkError> {
		switch detail {
		case .dailyBoxOfficeList:
			return Just(DailyBoxOfficeResult(page: .EMPTY) as NetworkResponse)
				.setFailureType(to: Error.self)
				.mapError({ NetworkError.request($0) })
				.eraseToAnyPublisher()
		}
	}
	
}
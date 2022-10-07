//
//  NetworkRequestTests.swift
//  ToyMovieListTests
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import XCTest
@testable import ToyMovieList

import Combine

class NetworkRequestTests: XCTestCase {
	private var cancellables: Set<AnyCancellable>!
	var sut: NetworkRequestable!

	override func setUp() {
		super.setUp()
		
		cancellables = []
		let testURL = URL(fileURLWithPath: "test")
		let testQueries = [String: String]()
		self.sut = MockNetworkRequest(base: testURL, queries: testQueries)
	}

	override func tearDown() {
		cancellables = nil
	}

	func testExample() throws {
		// give
		let expectation = expectation(description: "NetworkRequest")
		let empty = DailyBoxOfficeResult(page: .EMPTY)
		
		// when
		self.sut.request()
			.sink(
				receiveCompletion: { _ in },
				receiveValue: { value in
					
					// then
					XCTAssertNotNil(value)
					XCTAssertEqual((value as! DailyBoxOfficeResult).page.name, empty.page.name)
					expectation.fulfill()
				}
			)
			.store(in: &cancellables)

		wait(for: [expectation], timeout: 1)
	}
	
}

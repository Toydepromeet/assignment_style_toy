//
//  APITests.swift
//  ToyMovieListTests
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import XCTest
@testable import ToyMovieList

import Combine

class APITests: XCTestCase {
	private var cancellables: Set<AnyCancellable>!
	var sut: API!

	override func setUp() {
		super.setUp()
		
		cancellables = []
		self.sut = MockAPI()
	}

	override func tearDown() {
		cancellables = nil
	}

	func test_API_get메서드_호출시_데이터전달됨() throws {
		// give
		let expectation = XCTestExpectation(description: "API")
		let test = "TEST"
		
		// when
		self.sut.get(detail: .dailyBoxOfficeList)
			.sink(
				receiveCompletion: { _ in
				
				}, receiveValue: { value in
					
					// then
					XCTAssertNotNil(value)
					XCTAssertEqual((value as! DailyBoxOfficeResult).page.name, test)
					expectation.fulfill()
				}
			)
			.store(in: &cancellables)
		
		wait(for: [expectation], timeout: 1)
	}
	
}

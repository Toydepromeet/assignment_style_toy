//
//  DailyBoxOfficeListModelTests.swift
//  ToyMovieListTests
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import XCTest
@testable import ToyMovieList

import Combine

class DailyBoxOfficeListModelTests: XCTestCase {
	private var cancellables: Set<AnyCancellable>!
	var sut: DailyBoxOfficeListModel!

	override func setUp() {
		super.setUp()
		
		cancellables = []
		let api = MockAPI()
		self.sut = DailyBoxOfficeListModel(api: api)
	}

	override func tearDown() {
		cancellables = nil
	}

	func test_fetch() throws {
		// give
		let test = "TEST"
		
		// when
		self.sut.fetch() {
			// then
			XCTAssertEqual(self.sut.dataSource.name, test)
		}
		
	}
	
}

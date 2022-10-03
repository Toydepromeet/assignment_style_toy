//
//  EntityDecodingTests.swift
//  ToyMovieListTests
//
//  Created by Yongwoo Marco on 2022/10/03.
//

import XCTest
@testable import ToyMovieList

class EntityDecodingTests: XCTestCase {

	func test_JSON데이터_디코딩하면_DailyBoxOfficeMovie_인스턴스_생성됨() throws {
		// give
		let decoder = JSONDecoder()
		let jsonData = try! getData(fromJSON: "Entity")
		
		// when
		let result = try decoder.decode(DailyBoxOfficeResult.self, from: jsonData)

		// then
		XCTAssertEqual(result.page.list.count, 3)
	}

}

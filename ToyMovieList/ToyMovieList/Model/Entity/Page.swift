//
//  Page.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/09/30.
//

protocol Page: NetworkResponse {
	associatedtype Item
	static var EMPTY: Self { get }
	var name: String { get }
	var list: [Item] { get }
}

struct DailyBoxOfficePage: Page {
	typealias Item = DailyBoxOfficeMovie
	
	static let EMPTY: Self = .init(name: "EMPTY", list: [])
	
	enum CodingKeys: String, CodingKey {
		case name = "boxofficeType"
		case list = "dailyBoxOfficeList"
	}
		
	let name: String	// boxofficeType - 박스오피스 종류를 출력합니다.
	let list: [Item]	// dailyBoxOfficeList
}



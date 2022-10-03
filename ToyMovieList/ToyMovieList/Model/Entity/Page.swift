//
//  Page.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/09/30.
//

protocol Page: Decodable {
	associatedtype Item
	static var empty: Self { get }
	var name: String { get }
	var list: [Item] { get }
}

struct DailyBoxOfficeResult: Decodable {
	
	struct DailyBoxOfficePage: Page {
		typealias Item = DailyBoxOfficeMovie
		
		enum CodingKeys: String, CodingKey {
			case name = "boxofficeType"
			case list = "dailyBoxOfficeList"
		}
		
		static var empty: Self = .init(name: "", list: [])
		
		let name: String	// boxofficeType - 박스오피스 종류를 출력합니다.
		let list: [Item]	// dailyBoxOfficeList
	}
	
	enum CodingKeys: String, CodingKey {
		case page = "boxOfficeResult"
	}
	
	static let empty: Self = .init(page: .empty)
	
	let page: DailyBoxOfficePage
}



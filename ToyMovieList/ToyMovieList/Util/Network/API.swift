//
//  API.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import Foundation
import Combine

enum HTTPMethod {
	case get(GET)
	
	enum GET {
		case dailyBoxOfficeList
	}
}

protocol API {
	func get(detail: HTTPMethod.GET) -> AnyPublisher<NetworkResponse, NetworkError>
}

struct KoficAPI: API {
	
	private let baseURL: URL
	private let key: String
	
	init() {
		let baseURL = URL(string: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice")! // TODO: 변경예정
		let key = "90cafe1ff99c0f670078efe35f4e4120" // TODO: 변경예정
		self.baseURL = baseURL
		self.key = key
	}
	
	func get(detail: HTTPMethod.GET) -> AnyPublisher<NetworkResponse, NetworkError> {
		switch detail {
		case .dailyBoxOfficeList:
			return fetchDailyBoxOfficeList().request()
		}
	}
	
}

extension KoficAPI {

	private func fetchDailyBoxOfficeList() -> NetworkRequest<DailyBoxOfficeResult> {
		let calendar = Calendar.current
		let lastDate = calendar.date(byAdding: .day, value: -1, to: Date()) ?? Date()
		let description = baseURL.appendingPathComponent("searchDailyBoxOfficeList.json")
		let queries = ["key": key, "targetDt": lastDate.formattedTargetDt()]
		return NetworkRequest<DailyBoxOfficeResult>(base: description, queries: queries)
	}
	
}

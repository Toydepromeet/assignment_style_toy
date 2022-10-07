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
	
	init() throws {
		guard let filePath = Bundle.main.path(forResource: "NetworkInfo", ofType: "plist"),
			  let plist = NSDictionary(contentsOfFile: filePath),
			  let key = plist["API_KEY"] as? String,
			  let host = plist["HOST_URL"] as? String,
			  let baseURL = URL(string: host)
		else {
			throw AppError.local(.loadFileFailure)
		}
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
		let lastDate = Date.yesterday
		let description = baseURL.appendingPathComponent("searchDailyBoxOfficeList.json")
		let queries = ["key": key, "targetDt": lastDate.formattedTargetDate()]
		return NetworkRequest<DailyBoxOfficeResult>(base: description, queries: queries)
	}
	
}

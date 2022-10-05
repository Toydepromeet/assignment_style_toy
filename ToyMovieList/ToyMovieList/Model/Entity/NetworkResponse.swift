//
//  NetworkResponse.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/10/05.
//

import Foundation

protocol NetworkResponse: Decodable { }

struct DailyBoxOfficeResult: NetworkResponse {
	
	enum CodingKeys: String, CodingKey {
		case page = "boxOfficeResult"
	}
		
	let page: DailyBoxOfficePage
}

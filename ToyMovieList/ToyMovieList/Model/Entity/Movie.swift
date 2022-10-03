//
//  Movie.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/09/30.
//

protocol Movie: Identifiable, Decodable {
	var id: String { get }
	var name: String { get }
}

struct DailyBoxOfficeMovie: Movie {
	let id: String				// rnum - 순번을 출력합니다.
	let name: String			// movieNm - 영화명(국문)을 출력합니다.
	let	changedRate: String		// audiChange - 해당일의 관객수를 출력합니다.

	enum CodingKeys: String, CodingKey {
		case id = "rnum"
		case name = "movieNm"
		case changedRate = "audiChange"
	}
}

//
//  DailyBoxOfficeListModel.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import Foundation
import Combine

final class DailyBoxOfficeListModel {
	
	private var cacellableSet: Set<AnyCancellable> = []
	private let api: API
	
	@Published private(set) var dataSource: DailyBoxOfficePage = .EMPTY {
		didSet {
			print(dataSource) // TODO: TEST 코드
		}
	}
	
	init(api: API) {
		self.api = api
	}
	
	func fetch() {
		self.api.get(detail: .dailyBoxOfficeList)
			.sink(
				receiveCompletion: { _ in print("\(#function) completion") },
				receiveValue: { response in
					guard let result = response as? DailyBoxOfficeResult else {
						return
					}
					self.dataSource = result.page
				}
			)
			.store(in: &cacellableSet)
	}
	
}

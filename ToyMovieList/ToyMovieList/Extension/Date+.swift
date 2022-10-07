//
//  Date+.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import Foundation

extension Date {
	
	static let formatter = DateFormatter()
	
	func formattedTargetDt() -> String {
		Self.formatter.dateFormat = "yyyyMMdd"
		return Self.formatter.string(from: self)
	}
	
}

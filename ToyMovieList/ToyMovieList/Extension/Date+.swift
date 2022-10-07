//
//  Date+.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/10/07.
//

import Foundation

extension Date {
	
	static let formatter = DateFormatter()
	
	static var yesterday: Date {
		Calendar.current.date(byAdding: .day, value: -1, to: Self()) ?? Self()
	}
	
	func formattedTargetDate() -> String {
		Self.formatter.dateFormat = "yyyyMMdd"
		return Self.formatter.string(from: self)
	}
	
}

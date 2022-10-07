//
//  AppError.swift
//  ToyMovieList
//
//  Created by Yongwoo Marco on 2022/10/07.
//

enum AppError: Error {
	case local(Local)
	
	enum Local: Error {
		case loadFileFailure
	}
}

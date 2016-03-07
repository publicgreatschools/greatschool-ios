//
//  SchoolInfo.swift
//  Greatschools
//
//  Created by Jint on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

struct SchoolRate {
	let rate: Float
	let color: UIColor
}

struct SchoolStar {
	let count: Int
	let color: UIColor
}

struct SchoolInfo {
	let name: String
	let address: String
	let miles: Double
	let rateInfo: SchoolRate
	let starInfo: SchoolStar
	let reviews: Int
}

extension SchoolInfo {
	static var demoData = [
	SchoolInfo(name: "School Name A", address: "Public | 9 - 12 | Pleasant Hill, CA", miles: 3.25, rateInfo: SchoolRate(rate: 9, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 4, color: UIColor(hexRGB: 0x60BD02)), reviews: 314),
	SchoolInfo(name: "School Name B", address: "Private | 6 - 9 | Flower Hill, CA", miles: 1.7, rateInfo: SchoolRate(rate: 7, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 3, color: UIColor(hexRGB: 0x60BD02)), reviews: 211),
	SchoolInfo(name: "School Name C", address: "Public | 9 - 12 | Pleasant district, CA", miles: 9.43, rateInfo: SchoolRate(rate: 5, color: UIColor(hexRGB: 0xF5A623)), starInfo: SchoolStar(count: 2, color: UIColor(hexRGB: 0xF5A623)), reviews: 242),
	SchoolInfo(name: "School Name D", address: "Public | 1 - 6 | Pleasant Hill, CA", miles: 12.6, rateInfo: SchoolRate(rate: 8, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 4, color: UIColor(hexRGB: 0x60BD02)), reviews: 198)]
}
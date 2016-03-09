//
//  SchoolInfo.swift
//  Greatschools
//
//  Created by Jint on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

struct SchoolRate {
	let rate: Int
	let color: UIColor
}

struct SchoolStar {
	let count: Int
	let color: UIColor
}

struct SchoolInfo {
	let id: Int
	let pinColorId: Int
	let name: String
	let address: String
	let miles: Double
	let rateInfo: SchoolRate
	let starInfo: SchoolStar
	let reviews: Int
	let position: CGPoint
}

extension SchoolInfo {
	static var demoData = [
		SchoolInfo(id: 0, pinColorId: 0, name: "School Name A", address: "Public | 9 - 12 | Pleasant Hill, CA", miles: 3.25, rateInfo: SchoolRate(rate: 9, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 4, color: UIColor(hexRGB: 0x60BD02)), reviews: 314, position: CGPoint(x: 130, y: 140)),
	SchoolInfo(id: 1, pinColorId: 0, name: "School Name B", address: "Private | 6 - 9 | Flower Hill, CA", miles: 1.7, rateInfo: SchoolRate(rate: 7, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 3, color: UIColor(hexRGB: 0x60BD02)), reviews: 211, position: CGPoint(x: 150, y: 300)),
	SchoolInfo(id: 2, pinColorId: 1, name: "School Name C", address: "Public | 9 - 12 | Pleasant district, CA", miles: 9.43, rateInfo: SchoolRate(rate: 5, color: UIColor(hexRGB: 0xF5A623)), starInfo: SchoolStar(count: 2, color: UIColor(hexRGB: 0xF5A623)), reviews: 242, position: CGPoint(x: 200, y: 200)),
	SchoolInfo(id: 3, pinColorId: 0, name: "School Name AB", address: "Public | 1 - 6 | Pleasant Hill, CA", miles: 12.6, rateInfo: SchoolRate(rate: 8, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 4, color: UIColor(hexRGB: 0x60BD02)), reviews: 198, position: CGPoint(x: 230, y: 250))]
}

struct StatsInfo {
	let iconImage: String
	let name: String
	let count: String
}

extension StatsInfo {
	static var demoData = [StatsInfo(iconImage: "StatsDetails0", name: "Art & Music", count: "3"), StatsInfo(iconImage: "StatsDetails1", name: "Chess", count: "-"), StatsInfo(iconImage: "StatsDetails2", name: "Sports", count: "12"), StatsInfo(iconImage: "StatsDetails3", name: "World Languages", count: "-")]
}

struct OverviewInfo {
	let schoolRate: SchoolRate
	let reviewRate: SchoolRate
	let starInfo: SchoolStar
	let enrolled: Int
	let address: String
	let beforeCare: Bool
	let afterCare: Bool
}

extension OverviewInfo {
	static var demoData = OverviewInfo(schoolRate: SchoolRate(rate: 9, color: UIColor(hexRGB: 0x60BD02)), reviewRate: SchoolRate(rate: 2, color: UIColor(hexRGB: 0xF5A623)), starInfo: SchoolStar(count: 3, color: UIColor(hexRGB: 0xF5A623)), enrolled: 1950, address: "Public District, Pleasant Hill, CA", beforeCare: false, afterCare: false)
}

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
		SchoolInfo(id: 0, pinColorId: 0, name: "School Name A", address: "Public | 9 - 12 | Pleasant Hill, CA", miles: 3.25, rateInfo: SchoolRate(rate: 9, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 4, color: UIColor(hexRGB: 0x60BD02)), reviews: 718, position: CGPoint(x: 130, y: 140)),
		SchoolInfo(id: 0, pinColorId: 0, name: "School Name A", address: "Public | 9 - 12 | Pleasant Hill, CA", miles: 3.25, rateInfo: SchoolRate(rate: 3, color: UIColor(hexRGB: 0xF5A623)), starInfo: SchoolStar(count: 1, color: UIColor(hexRGB: 0xF5A623)), reviews: 121, position: CGPoint(x: 130, y: 140)),
		SchoolInfo(id: 0, pinColorId: 0, name: "School Name A", address: "Public | 9 - 12 | Pleasant Hill, CA", miles: 3.25, rateInfo: SchoolRate(rate: 6, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 3, color: UIColor(hexRGB: 0x60BD02)), reviews: 417, position: CGPoint(x: 130, y: 140)),
		SchoolInfo(id: 0, pinColorId: 0, name: "School Name A", address: "Public | 9 - 12 | Pleasant Hill, CA", miles: 3.25, rateInfo: SchoolRate(rate: 5, color: UIColor(hexRGB: 0xF5A623)), starInfo: SchoolStar(count: 2, color: UIColor(hexRGB: 0xF5A623)), reviews: 203, position: CGPoint(x: 130, y: 140)),
		SchoolInfo(id: 0, pinColorId: 0, name: "School Name A", address: "Public | 9 - 12 | Pleasant Hill, CA", miles: 3.25, rateInfo: SchoolRate(rate: 8, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 4, color: UIColor(hexRGB: 0x60BD02)), reviews: 688, position: CGPoint(x: 130, y: 140)),
		SchoolInfo(id: 0, pinColorId: 0, name: "School Name A", address: "Public | 9 - 12 | Pleasant Hill, CA", miles: 3.25, rateInfo: SchoolRate(rate: 6, color: UIColor(hexRGB: 0x60BD02)), starInfo: SchoolStar(count: 3, color: UIColor(hexRGB: 0x60BD02)), reviews: 405, position: CGPoint(x: 130, y: 140))]
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


struct ReviewInfo {
	let starInfo: SchoolStar
	let date: String
	let comment: String
	let imageName: String
	let reviewerName: String
}

extension ReviewInfo {
	static var demoData = [
		ReviewInfo(starInfo: SchoolStar(count: 2, color: UIColor(hexRGB: 0xF5A623)), date: "August 24, 2015", comment: "The administration at this school is an embarrassment. The level of incompetency is monumental. The fact that the students succeed at all is due entirely to the many excellent teachers and parental involvement. ", imageName: "ReviewPic0", reviewerName: "Sunny"),
	ReviewInfo(starInfo: SchoolStar(count: 4, color: UIColor(hexRGB: 0x60BD02)), date: "August 23, 2015", comment: "The administration at this school is an embarrassment. The level of incompetency is monumental. The fact that the students succeed at all is due entirely to the many excellent teachers and parental involvement. ", imageName: "", reviewerName: "Tony"),
	ReviewInfo(starInfo: SchoolStar(count: 3, color: UIColor(hexRGB: 0xF5A623)), date: "August 23, 2015", comment: "I've only been going to College Park for a week now and I already love the school! Not only do the teachers care, but the electives they offer are more than I've ever seen! ", imageName: "ReviewPic2", reviewerName: "Evan")]
}



struct ReviewBarInfo {
	let colorID: Int
	let count: Int
}

extension ReviewBarInfo {
	static var demoData = [ReviewBarInfo(colorID: 5, count: 38), ReviewBarInfo(colorID: 4, count: 10), ReviewBarInfo(colorID: 3, count: 6), ReviewBarInfo(colorID: 2, count: 4), ReviewBarInfo(colorID: 1, count: 2)]
}


struct ReviewTotalInfo {
	let rate: Float
	let starInfo: SchoolStar
	let reviewCount: Int
	let barInfos: [ReviewBarInfo]!
}

extension ReviewTotalInfo {
	static var demoData = ReviewTotalInfo(rate: 4.3, starInfo: SchoolStar(count: 4, color: UIColor(hexRGB: 0x62717F)), reviewCount: 60, barInfos: ReviewBarInfo.demoData)
}



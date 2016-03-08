//
//  AppInfo.swift
//  Greatschools
//
//  Created by SunyQin on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Foundation

struct AppInfo {
	let name: String
	let imageName: String
}

extension AppInfo {
	static var demoData = [
		AppInfo(name: "Feeling Word Game", imageName: "appIcon1"),
		AppInfo(name: "Emotional Toolbox", imageName: "appIcon2"),
		AppInfo(name: "Through a child's eyes videos", imageName: "appIcon3")
	]
}
//
//  TabbarViewController.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let nearby = UIStoryboard(name: "NearBy", bundle: nil).instantiateInitialViewController() as! UINavigationController
		nearby.tabBarItem = TabBarItem(title: "Nearby", imageName: "nearby")
		
		let search = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as! UINavigationController
		search.tabBarItem = TabBarItem(title: "Search", imageName: "search")
		
		let myschools = UIStoryboard(name: "MySchools", bundle: nil).instantiateInitialViewController() as! UINavigationController
		myschools.tabBarItem = TabBarItem(title: "MySchools", imageName: "myschools")
		
		let greatkids = UIStoryboard(name: "GreatKids", bundle: nil).instantiateInitialViewController() as! UINavigationController
		greatkids.tabBarItem = TabBarItem(title: "GreatKids!", imageName: "greatkids")
		
		viewControllers = [nearby, search, myschools, greatkids]
	}
}
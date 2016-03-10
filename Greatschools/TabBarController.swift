//
//  TabbarViewController.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit
import SVProgressHUD

class TabBarController: UITabBarController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let nearby = UIStoryboard(name: "NearBy", bundle: nil).instantiateInitialViewController() as! UINavigationController
		nearby.tabBarItem = TabBarItem(title: "Nearby", imageName: "nearby")
		
		let search = UIStoryboard(name: "Search", bundle: nil).instantiateInitialViewController() as! UINavigationController
		search.tabBarItem = TabBarItem(title: "Search", imageName: "search")
		
		let myschools = UIStoryboard(name: "MySchools", bundle: nil).instantiateInitialViewController() as! UINavigationController
		myschools.tabBarItem = TabBarItem(title: "My Schools", imageName: "myschools")
		
		let greatkids = UIStoryboard(name: "GreatKids", bundle: nil).instantiateInitialViewController() as! UINavigationController
		greatkids.tabBarItem = TabBarItem(title: "GreatKids!", imageName: "greatkids")
		
		viewControllers = [nearby, search, myschools, greatkids]
	}
	
	override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
		if let index = tabBar.items?.indexOf(item) {
			switch index {
			case 0:
				if let nav = viewControllers?[index] as? UINavigationController, let _ = nav.viewControllers.first as? PickSchoolViewController {
					nav.popToRootViewControllerAnimated(true)
				}
			case 2,3:
				SVProgressHUD.setDefaultMaskType(.Gradient)
				SVProgressHUD.showWithStatus("Coming soon!")
				dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
					SVProgressHUD.dismiss()
				})
			default: return
			}
		}
	}
}

//
//  AppDelegate+Appearance.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit
import Greycats

extension AppDelegate {
	
	func loadAppearance() {
		window?.backgroundColor = UIColor.whiteColor()
		window?.tintColor = UIColor.barBlueColor()
		
		let tabBarAppearance = UITabBar.appearance()
		tabBarAppearance.translucent = false
		tabBarAppearance.backgroundImage = UIImage(fromColor: UIColor.whiteColor())
		
		let tabBarItemAppearance = UITabBarItem.appearance()
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 13
		tabBarItemAppearance.setTitleTextAttributes([NSFontAttributeName: UIFont.semiBoldFontOfSize(11), NSForegroundColorAttributeName: UIColor.barGreyColor(), NSKernAttributeName: 0.7, NSParagraphStyleAttributeName: paragraphStyle], forState: .Normal)
		tabBarItemAppearance.setTitleTextAttributes([NSFontAttributeName: UIFont.semiBoldFontOfSize(11), NSForegroundColorAttributeName: UIColor.barBlueTextColor(), NSKernAttributeName: 0.7, NSParagraphStyleAttributeName: paragraphStyle], forState: .Selected)
	}
}
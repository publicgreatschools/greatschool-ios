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
		
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 22
		let navigationBarAppearance = UINavigationBar.appearance()
		navigationBarAppearance.titleTextAttributes = [NSFontAttributeName: UIFont.semiBoldFontOfSize(18), NSForegroundColorAttributeName: UIColor.whiteColor(), NSParagraphStyleAttributeName: paragraphStyle]
		navigationBarAppearance.shadowImage = UIImage()
		navigationBarAppearance.translucent = false
		
		let transparentNavigationBar: UINavigationBar
		if #available(iOS 9.0, *) {
			transparentNavigationBar = UINavigationBar.appearanceWhenContainedInInstancesOfClasses([TransparentNavigationController.self])
		} else {
			transparentNavigationBar = UINavigationBar.appearanceWhenContainedInInstancesOfClass(TransparentNavigationController.self)
		}
		transparentNavigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
		transparentNavigationBar.translucent = true
		
		let barButtonItemAppearance = UIBarButtonItem.appearance()
		barButtonItemAppearance.setTitleTextAttributes([NSFontAttributeName: UIFont.regularFontOfSize(14), NSForegroundColorAttributeName: UIColor.whiteColor(), NSKernAttributeName: 1, NSParagraphStyleAttributeName: paragraphStyle], forState: .Normal)
		barButtonItemAppearance.setTitleTextAttributes([NSFontAttributeName: UIFont.regularFontOfSize(14), NSForegroundColorAttributeName: UIColor.barGreyColor(), NSKernAttributeName: 1, NSParagraphStyleAttributeName: paragraphStyle], forState: .Disabled)
		
		let tabBarAppearance = UITabBar.appearance()
		tabBarAppearance.translucent = false
		tabBarAppearance.backgroundImage = UIImage(fromColor: UIColor.whiteColor())
		
		let tabBarItemAppearance = UITabBarItem.appearance()
		paragraphStyle.lineSpacing = 13
		tabBarItemAppearance.setTitleTextAttributes([NSFontAttributeName: UIFont.semiBoldFontOfSize(11), NSForegroundColorAttributeName: UIColor.barGreyColor(), NSKernAttributeName: 0.7, NSParagraphStyleAttributeName: paragraphStyle], forState: .Normal)
		tabBarItemAppearance.setTitleTextAttributes([NSFontAttributeName: UIFont.semiBoldFontOfSize(11), NSForegroundColorAttributeName: UIColor.barBlueTextColor(), NSKernAttributeName: 0.7, NSParagraphStyleAttributeName: paragraphStyle], forState: .Selected)
	}
}
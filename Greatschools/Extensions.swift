//
//  Extensions.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

extension UITabBar {
	public override func sizeThatFits(size: CGSize) -> CGSize {
		var sizeThatFits = super.sizeThatFits(size)
		sizeThatFits.height = TabBarHeight
		return sizeThatFits
	}
}

extension UIFont {
	class func regularFontOfSize(fontSize: CGFloat) -> UIFont {
		return UIFont(name: regularFont, size: fontSize)!
	}
	
	class func lightFontOfSize(fontSize: CGFloat) -> UIFont {
		return UIFont(name: lightFont, size: fontSize)!
	}
	
	class func boldFontOfSize(fontSize: CGFloat) -> UIFont {
		return UIFont(name: boldFont, size: fontSize)!
	}
	
	class func semiBoldFontOfSize(fontSize: CGFloat) -> UIFont {
		return UIFont(name: semiBoldFont, size: fontSize)!
	}
}

extension UIColor {
	class func barBlueColor() -> UIColor {
		return UIColor(hexRGB: 0x0DA7E3)
	}
	
	class func barGreyColor() -> UIColor {
		return UIColor(hexRGB: 0x888889)
	}
	
	class func barBlueTextColor() -> UIColor {
		return UIColor(hexRGB: 0x0E94C7)
	}
}
//
//  Extensions.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

extension UIImage {
	class func imageFromColors(colors: [CGColorRef], horizontal: Bool = true) -> UIImage {
		let size = CGSizeMake(1, 1)
		return self.imageFromSize(size) { context in
			let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), colors, nil)
			CGContextDrawLinearGradient(context, gradient,
				CGPointMake(0, 0),
				CGPointMake(horizontal ? size.width : 0, horizontal ? 0 : size.height),
				CGGradientDrawingOptions.DrawsBeforeStartLocation.union(CGGradientDrawingOptions.DrawsAfterEndLocation))
		}
	}
	
	class func imageFromSize(size: CGSize, block: (CGContextRef -> Void)) -> UIImage {
		UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
		let context = UIGraphicsGetCurrentContext()
		block(context!)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}
}

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
	
	class func ssStandardFontOfSize(fontSize: CGFloat) -> UIFont {
		return UIFont(name: ssFont, size: fontSize)!
	}
}

extension String {
	var length: Int {
		return characters.count
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
	
	class func lightGreenColor() -> UIColor {
		return UIColor(hexRGB: 0xB8E986)
	}
	
	class func backgroundColor() -> UIColor {
		return UIColor(hexRGB: 0xF0F5F6)
	}
}
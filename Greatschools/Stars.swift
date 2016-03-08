//
//  Stars.swift
//  Greatschools
//
//  Created by Jint on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Greycats

@IBDesignable
class Stars: NibView {
	@IBOutlet var starArray: [UIImageView]!
	
	var starInfo: SchoolStar! {
		didSet {
			starArray.enumerate().forEach{i, star in
				let starItem = star as UIImageView
				let imageTemplate = UIImage(named: "star")!.imageWithRenderingMode(.AlwaysTemplate)
				starItem.image = imageTemplate
				if i < starInfo.count {
					starItem.tintColor = starInfo.color
				}
				else {
					starItem.tintColor = UIColor(hexRGB: 0xDBDBDB)
				}
			}
		}
	}
}


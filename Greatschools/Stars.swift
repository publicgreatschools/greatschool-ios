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
	
	@IBInspectable var starColor: UIColor = UIColor(hexRGB: 0x68B131) {
		didSet { setStar() }
	}
	@IBInspectable var starCount: Int = 3 {
		didSet { setStar() }
	}
	
	convenience init() {
		self.init()
		
//		var arrayStar : [UIImageView] = []
//		for _ in 0..<5 {
//			let image = UIImage(named: "star")!.imageWithRenderingMode(.AlwaysTemplate)
//			arrayStar.insert(UIImageView(image: image), atIndex: 0)
//		}
//		self -< arrayStar
		
//		starArray.forEach {
//			let image = UIImage(named: "star")!.imageWithRenderingMode(.AlwaysTemplate)
//			$0.image = image
//		}
	}
	
	private func setStar() {
//		starArray.forEach {
//			let image = UIImage(named: "star")!.imageWithRenderingMode(.AlwaysTemplate)
//			$0.image = image
//		}
		starArray.enumerate().forEach{i, star in
			if i < starCount {
				(star as UIImageView).tintColor = starColor
			}
			else {
				(star as UIImageView).tintColor = UIColor(hexRGB: 0x68B131)
			}
		}
	}
}


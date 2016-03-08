//
//  MapView.swift
//  Greatschools
//
//  Created by Jint on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class MapView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		let imageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
		imageView.image = UIImage(named: "Bitmap")
		self.addSubview(imageView)
		showPins()
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	// MARK - public method
	
	func showPins() {
		for schoolInfo in SchoolInfo.demoData {
			let pin = PinView(schoolInfo: schoolInfo)
			self.addSubview(pin)
		}
	}
}


class PinView: UIView {
	init(schoolInfo: SchoolInfo) {
		super.init(frame: CGRectMake(CGFloat(arc4random_uniform(300)), 150+CGFloat(arc4random_uniform(200)), 47, 53))
		let imageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
		imageView.image = UIImage(named: schoolInfo.pinColorId == 0 ? "PinGreen" : "PinOrange")
		self.addSubview(imageView)
		let rateLabel = UILabel(frame: CGRectMake(12, 9, 13, 20))
		rateLabel.textAlignment = .Center
		rateLabel.font = UIFont(name: "ProximaNova-Semibold", size: 16.65)
		rateLabel.textColor = schoolInfo.pinColorId == 0 ? UIColor(hexRGB: 0x7BC526) : UIColor(hexRGB: 0xF37746)
		rateLabel.text = "\(schoolInfo.rateInfo.rate)"
		imageView.addSubview(rateLabel)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
}
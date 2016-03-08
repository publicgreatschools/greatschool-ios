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
		
		let tapGesture = UITapGestureRecognizer(target: self, action: "resetPin:")
		tapGesture.numberOfTapsRequired = 1
		self.addGestureRecognizer(tapGesture)
		
		let imageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
		imageView.image = UIImage(named: "Bitmap")
		self.addSubview(imageView)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func willMoveToSuperview(newSuperview: UIView?) {
		for schoolInfo in SchoolInfo.demoData {
			let pin = PinView(schoolInfo: schoolInfo)
			self.addSubview(pin)
			UIView.animateWithDuration(0.5, animations: {
				pin.transform = CGAffineTransformScale(self.transform, 1/2, 1/2)
				pin.transform = CGAffineTransformScale(self.transform, 2, 2)
				pin.transform = CGAffineTransformIdentity
			})
		}
	}
	
	func resetPin(gesture: UIPanGestureRecognizer) {
		if let pinScale = PinView.scalePin {
			UIView.animateWithDuration(0.3, animations: {
				pinScale.transform = CGAffineTransformIdentity
			})
			PinView.scalePin = nil
		}
	}
}

// MARK: -

class PinView: UIView {
	var schoolID: Int
	static var scalePin: PinView?
	
	init(schoolInfo: SchoolInfo) {
		schoolID = schoolInfo.id
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
		
		let tapGesture = UITapGestureRecognizer(target: self, action: "pinTap:")
		tapGesture.numberOfTapsRequired = 1
		self.addGestureRecognizer(tapGesture)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	func pinTap(gesture: UIPanGestureRecognizer) {
		print("SchoolID:\(self.schoolID)")
		let pinScale = PinView.scalePin
		
		if (pinScale != nil) {
			if pinScale?.schoolID == self.schoolID {
				return
			}
			else {
				UIView.animateWithDuration(0.3, animations: {
					pinScale!.transform = CGAffineTransformScale(pinScale!.transform, 1/2, 1/2)
				})
			}
		}
		
		PinView.scalePin = self
		UIView.animateWithDuration(0.3, animations: {
			self.transform = CGAffineTransformScale(self.transform, 2, 2)
		})
	}
}
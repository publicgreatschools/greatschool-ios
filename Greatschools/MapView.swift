//
//  MapView.swift
//  Greatschools
//
//  Created by Jint on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class MapView: UIView {
	var imageView: UIImageView!
	var scaledPin: PinView?
	var infoView: SchoolInfoView!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		let tapGesture = UITapGestureRecognizer(target: self, action: "resetPin:")
		tapGesture.numberOfTapsRequired = 1
		self.addGestureRecognizer(tapGesture)
		
		imageView = UIImageView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
		imageView.image = UIImage(named: "Bitmap")
		
		infoView = SchoolInfoView()
		infoView.frame = CGRectMake(16, 11, self.frame.size.width-16*2, 130)
		infoView.tag = 99
		infoView.backgroundColor = UIColor.whiteColor()
		infoView.cornerRadius = 4
		infoView.masksToBounds = true
		infoView.transform = CGAffineTransformScale(self.infoView.transform, 0, 0)
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func willMoveToSuperview(newSuperview: UIView?) {
		for subView in self.subviews {
			subView.removeFromSuperview()
		}
		
		self.addSubview(imageView)
		self.addSubview(infoView)
		
		for schoolInfo in SchoolInfo.demoData {
			let pin = PinView(info: schoolInfo)
			let tapGesture = UITapGestureRecognizer(target: self, action: "pinTap:")
			tapGesture.numberOfTapsRequired = 1
			pin.addGestureRecognizer(tapGesture)
			
			self.addSubview(pin)
			UIView.animateWithDuration(0.5, animations: {
				pin.transform = CGAffineTransformScale(self.transform, 1/2, 1/2)
				pin.transform = CGAffineTransformScale(self.transform, 2, 2)
				pin.transform = CGAffineTransformIdentity
			})
		}
	}
	
	func resetPin(gesture: UIPanGestureRecognizer) {
		if let pin = scaledPin {
			UIView.animateWithDuration(0.3, animations: {
				pin.transform = CGAffineTransformIdentity
				self.infoView.transform = CGAffineTransformScale(self.infoView.transform, 0, 0)
			})
			scaledPin = nil
		}
	}
	
	func pinTap(gesture: UIPanGestureRecognizer) {
		if let pinCurrent = gesture.view as? PinView {
			if let pinScaled = scaledPin {
				if pinCurrent.schoolInfo.id == pinScaled.schoolInfo.id {
					return
				}
				else {
					UIView.animateWithDuration(0.3, animations: {
						pinScaled.transform = CGAffineTransformScale(pinScaled.transform, 1/2, 1/2)
						self.infoView.transform = CGAffineTransformScale(self.infoView.transform, 0, 0)
						}, completion: {finished in
							self.scaledPin = pinCurrent
							self.infoView.schoolInfo = pinCurrent.schoolInfo
							UIView.animateWithDuration(0.3, animations: {
								pinCurrent.transform = CGAffineTransformScale(pinCurrent.transform, 2, 2)
								self.infoView.transform = CGAffineTransformIdentity
							})
					})
				}
			} else {
				scaledPin = pinCurrent
				infoView.schoolInfo = pinCurrent.schoolInfo
				UIView.animateWithDuration(0.3, animations: {
					pinCurrent.transform = CGAffineTransformScale(pinCurrent.transform, 2, 2)
					self.infoView.transform = CGAffineTransformIdentity
				})
			}
		}
	}
}

// MARK: -

class PinView: UIView {
	var schoolInfo: SchoolInfo
	
	init(info: SchoolInfo) {
		schoolInfo = info
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
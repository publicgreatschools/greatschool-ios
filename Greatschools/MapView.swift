//
//  MapView.swift
//  Greatschools
//
//  Created by Jint on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class MapView: UIView {
	var demoData: [SchoolInfo]!
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
		
		infoView = SchoolInfoView(frame: CGRectMake(16, 11, self.frame.size.width-16*2, 130))
		infoView.backgroundColor = UIColor.whiteColor()
		infoView.cornerRadius = 4
		infoView.masksToBounds = true
	}

	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	override func willMoveToSuperview(newSuperview: UIView?) {
		self.resetData()
	}
	
	func resetPin(gesture: UIPanGestureRecognizer) {
		if let pin = scaledPin {
			UIView.animateWithDuration(0.3, animations: {
				pin.transform = CGAffineTransformIdentity
				self.infoView.alpha = 0
				self.infoView.transform = CGAffineTransformTranslate(self.infoView.transform, 0, -100)
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
						self.infoView.alpha = 0
						self.infoView.transform = CGAffineTransformTranslate(self.infoView.transform, 0, -100)
						}, completion: {finished in
							self.scaledPin = pinCurrent
							self.infoView.schoolInfo = pinCurrent.schoolInfo
							UIView.animateWithDuration(0.3, animations: {
								pinCurrent.transform = CGAffineTransformScale(pinCurrent.transform, 2, 2)
								self.infoView.alpha = 1
								self.infoView.transform = CGAffineTransformIdentity
							})
					})
				}
			} else {
				scaledPin = pinCurrent
				infoView.schoolInfo = pinCurrent.schoolInfo
				UIView.animateWithDuration(0.3, animations: {
					pinCurrent.transform = CGAffineTransformScale(pinCurrent.transform, 2, 2)
					self.infoView.alpha = 1
					self.infoView.transform = CGAffineTransformIdentity
				})
			}
		}
	}
	
	func resetData() {
		for subView in self.subviews {
			subView.removeFromSuperview()
		}
		
		scaledPin = nil
		self.addSubview(imageView)
		infoView.alpha = 0
		infoView.transform = CGAffineTransformTranslate(self.infoView.transform, 0, -100)
		self.addSubview(infoView)
		
		for schoolInfo in demoData {
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
}

// MARK: -

class PinView: UIView {
	var schoolInfo: SchoolInfo
	
	init(info: SchoolInfo) {
		schoolInfo = info
		super.init(frame: CGRectMake(schoolInfo.position.x, schoolInfo.position.y, 47, 53))
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
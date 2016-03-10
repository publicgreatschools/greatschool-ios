//
//  ViewController.swift
//  Greatschools
//
//  Created by SunyQin on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit
import Greycats

class ViewController: UIViewController, UIGestureRecognizerDelegate, KeyboardResponder {
	var autoDetectKeyboard: Bool = false
	var shouldTapToEndEditing: Bool = false {
		didSet {
			if shouldTapToEndEditing {
				let tap = UITapGestureRecognizer(target: self, action: "endEditing")
				tap.delegate = self
				view.addGestureRecognizer(tap)
			}
		}
	}
	var fullScreenLayout: Bool = true {
		didSet {
			edgesForExtendedLayout = fullScreenLayout ? .All : .None
			automaticallyAdjustsScrollViewInsets = fullScreenLayout
		}
	}
	
	func keyboardWillChange(notif: NSNotification) {
		if let info = notif.userInfo {
			var kbRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
			kbRect = view.convertRect(kbRect, fromView: view.window)
			let height = view.bounds.size.height - kbRect.origin.y
			if let constraint = keyboardHeight {
				if constraint.constant != height {
					view.layoutIfNeeded()
					constraint.constant = height > 0 ? height : 0
					UIView.animateWithDuration(info[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval, delay: 0, options: UIViewAnimationOptions(rawValue: info[UIKeyboardAnimationCurveUserInfoKey] as! UInt), animations: {
						self.view.layoutIfNeeded()
						}, completion: nil)
				}
				return
			}
			if let this = self as? AutoFocus,
				scrollView = this.scrollingView() {
					let insets = UIEdgeInsetsMake(0, 0, height, 0)
					scrollView.contentInset = insets
					scrollView.scrollIndicatorInsets = insets
					if let field = this.activeField() {
						let frame = field.convertRect(field.bounds, toView: view)
						scrollView.scrollRectToVisible(frame, animated: true)
					}
			}
		}
		UIView.setAnimationsEnabled(true)
	}
	
	@IBAction func endEditing() {
		view.endEditing(true)
	}
	
	@IBOutlet weak var keyboardHeight: NSLayoutConstraint!
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		if autoDetectKeyboard {
			registerKeyboard()
		}
	}
	
	override func viewWillDisappear(animated: Bool) {
		super.viewWillDisappear(animated)
		if autoDetectKeyboard {
			unregisterKeyboard()
		}
	}
	
	@IBAction func unwindSegueToViewController(segue: UIStoryboardSegue) {
	}
	
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
		print(NSStringFromClass(self.dynamicType) + " deinit")
	}
}

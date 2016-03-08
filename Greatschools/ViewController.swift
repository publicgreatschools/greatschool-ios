//
//  ViewController.swift
//  Greatschools
//
//  Created by SunyQin on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit
import Greycats

class ViewController: UIViewController, UIGestureRecognizerDelegate {
	var fullScreenLayout: Bool = true {
		didSet {
			edgesForExtendedLayout = fullScreenLayout ? .All : .None
			automaticallyAdjustsScrollViewInsets = fullScreenLayout
		}
	}
	
	@IBAction func unwindSegueToViewController(segue: UIStoryboardSegue) {
	}
	
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
		print(NSStringFromClass(self.dynamicType) + " deinit")
	}
}

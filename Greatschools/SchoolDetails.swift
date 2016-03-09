//
//  SchoolDetails.swift
//  Greatschools
//
//  Created by SunyQin on 3/9/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit
import Greycats

class TestViewController: ViewController {
	@IBOutlet weak var titleLabel: UILabel!
}

class SchoolDetailsViewController: ViewController {
	
	@IBOutlet var container: [UIView]!
	@IBOutlet var segment: CustomSegment!
	var selectedTab: Int = 0
	
	var topView: UIView? {
		get {
			for view in container {
				if !view.hidden {
					return view
				}
			}
			return nil
		}
	}
	
	func transitionToTab(tab: Int) {
		topView?.endEditing(true)
		for (i, controller) in childViewControllers.enumerate() {
			if i == tab {
				controller.beginAppearanceTransition(true, animated: true)
				container[i].hidden = false
				controller.endAppearanceTransition()
				selectedTab = tab
			} else {
				foreground {
					if !self.container[i].hidden {
						controller.beginAppearanceTransition(false, animated: true)
						self.container[i].hidden = true
						controller.endAppearanceTransition()
					}
				}
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		fullScreenLayout = false
		segment.onSelected = { index in
			self.transitionToTab(index)
		}
	}
}

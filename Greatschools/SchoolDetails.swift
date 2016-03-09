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

class StatsController: TestViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.estimatedRowHeight = 100
		tableView.registerNib(UINib(nibName: "StatsDetailsCell", bundle: nil), forCellReuseIdentifier: "StatsDetailsCell")
		tableView.registerNib(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "CardCell")
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 3
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 4
		} else if section == 1 {
			return 2
		}
		return 1
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			let cell = tableView.dequeueReusableCellWithIdentifier("StatsDetailsCell", forIndexPath: indexPath) as! StatsDetailsCell
			cell.info = StatsInfo.demoData[indexPath.row]
			return cell
		} else {
			let cell = tableView.dequeueReusableCellWithIdentifier("CardCell", forIndexPath: indexPath) as! CardCell
			return cell
		}
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 38
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier("PickSchoolHeader") as! PickSchoolHeader
		if section == 0 {
			header.titleLabel.text = "DETAILS OVERVIEW"
		} else if section == 1 {
			header.titleLabel.text = "TEST SCORES"
		} else {
			header.titleLabel.text = "HOMES IN THE SCHOOL DISTRICT"
		}
		header.isFirstSection = section == 0
		return header
	}
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
	var topRequestViewController: TestViewController? {
		get {
			for controller in childViewControllers as! [TestViewController] {
				if !controller.view.hidden {
					return controller
				}
			}
			return nil
		}
	}
	
	func transitionToTab(tab: Int) {
		topView?.endEditing(true)
		for (i, controller) in (childViewControllers as! [TestViewController]).enumerate() {
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

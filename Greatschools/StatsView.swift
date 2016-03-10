//
//  StatsView.swift
//  Greatschools
//
//  Created by SunyQin on 3/10/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Foundation

class StatsController: ViewController, UITableViewDelegate, UITableViewDataSource {
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.estimatedRowHeight = 212
		tableView.registerNib(UINib(nibName: "StatsDetailsCell", bundle: nil), forCellReuseIdentifier: "StatsDetailsCell")
		tableView.registerNib(UINib(nibName: "TestScoreCell", bundle: nil), forCellReuseIdentifier: "TestScoreCell")
		tableView.registerNib(UINib(nibName: "HomesCell", bundle: nil), forCellReuseIdentifier: "HomesCell")
		tableView.registerNib(UINib(nibName: "DescriptionCell", bundle: nil), forCellReuseIdentifier: "DescriptionCell")
		tableView.registerNib(UINib(nibName: "PickSchoolHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "PickSchoolHeader")
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 4
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
		} else if indexPath.section == 1 {
			let cell = tableView.dequeueReusableCellWithIdentifier("TestScoreCell", forIndexPath: indexPath) as! TestScoreCell
			return cell
		} else if indexPath.section == 2 {
			let cell = tableView.dequeueReusableCellWithIdentifier("HomesCell", forIndexPath: indexPath) as! HomesCell
			return cell
		} else {
			let cell = tableView.dequeueReusableCellWithIdentifier("DescriptionCell", forIndexPath: indexPath) as! DescriptionCell
			return cell
		}
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if section == 0 {
			return 57
		}
		return 38
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier("PickSchoolHeader") as! PickSchoolHeader
		switch section {
		case 0:
			header.titleLabel.text = "DETAILS OVERVIEW"
		case 1:
			header.titleLabel.text = "TEST SCORES"
		case 2:
			header.titleLabel.text = "HOMES IN THE SCHOOL DISTRICT"
		default:
			header.titleLabel.text = "DESCRIPTION"
		}
		return header
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: false)
	}
}

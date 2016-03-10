//
//  PickSchoolViewController.swift
//  Greatschools
//
//  Created by SunyQin on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class PickSchoolViewController: ViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.backgroundColor()
		fullScreenLayout = false
		tableView.estimatedRowHeight = 144
		tableView.registerNib(UINib(nibName: "SchoolInfoCell", bundle: nil), forCellReuseIdentifier: "SchoolInfoCell")
		tableView.registerNib(UINib(nibName: "MileStoneCell", bundle: nil), forCellReuseIdentifier: "MileStoneCell")
		tableView.registerNib(UINib(nibName: "SimpleCell", bundle: nil), forCellReuseIdentifier: "SimpleCell")
		tableView.registerNib(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "CardCell")
		tableView.registerNib(UINib(nibName: "AppCell", bundle: nil), forCellReuseIdentifier: "AppCell")
		tableView.registerNib(UINib(nibName: "PickSchoolHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "PickSchoolHeader")
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 3
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return SchoolInfo.demoData.count + 1
		} else if section == 1 {
			return 2
		} else {
			return AppInfo.demoData.count
		}
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			if indexPath.row < SchoolInfo.demoData.count {
				let cell = tableView.dequeueReusableCellWithIdentifier("SchoolInfoCell", forIndexPath: indexPath) as! SchoolInfoCell
				cell.schoolInfo = SchoolInfo.demoData[indexPath.row]
				return cell
			} else {
				let cell = tableView.dequeueReusableCellWithIdentifier("SimpleCell", forIndexPath: indexPath) as! SimpleCell
				return cell
			}
		} else if indexPath.section == 1 {
			if indexPath.row == 0 {
				let cell = tableView.dequeueReusableCellWithIdentifier("MileStoneCell", forIndexPath: indexPath) as! MileStoneCell
				return cell
			} else {
				let cell = tableView.dequeueReusableCellWithIdentifier("CardCell", forIndexPath: indexPath) as! CardCell
				return cell
			}
		} else {
			let cell = tableView.dequeueReusableCellWithIdentifier("AppCell", forIndexPath: indexPath) as! AppCell
			cell.info = AppInfo.demoData[indexPath.row]
			return cell
		}
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		if indexPath.section == 0 {
			if indexPath.row < SchoolInfo.demoData.count {
				return 144
			}
			return 62
		} else if indexPath.section == 1 {
			if indexPath.row == 0 {
				return 290
			}
			return UITableViewAutomaticDimension
		}
		return 75
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		if section == 0 || section == 1 {
			return 52
		}
		return CGFloat.min
	}
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if section == 0 || section == 1 {
			let header = tableView.dequeueReusableHeaderFooterViewWithIdentifier("PickSchoolHeader") as! PickSchoolHeader
			header.titleLabel.text = section == 0 ? "ASSIGNED SCHOOLS" : "RECOMMENDED CONTENT"
			return header
		}
		return nil
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		performSegueWithIdentifier("detail", sender: nil)
	}
}


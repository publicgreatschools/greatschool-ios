//
//  OverView.swift
//  Greatschools
//
//  Created by Jint on 3/9/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Greycats

class OverviewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	var demoData: OverviewInfo!
	
	// MARK: - override
	
	override func viewDidLoad() {
		super.viewDidLoad()
		demoData = OverviewInfo.demoData
		tableView.registerNib(UINib(nibName: "OverviewRatingCell", bundle: nil), forCellReuseIdentifier: "OverviewRatingCell")
		tableView.registerNib(UINib(nibName: "OverviewReviewCell", bundle: nil), forCellReuseIdentifier: "OverviewReviewCell")
		tableView.registerNib(UINib(nibName: "OverviewEnrolledCell", bundle: nil), forCellReuseIdentifier: "OverviewEnrolledCell")
		tableView.registerNib(UINib(nibName: "OverviewLocationCell", bundle: nil), forCellReuseIdentifier: "OverviewLocationCell")
		tableView.registerNib(UINib(nibName: "OverviewBeforeCell", bundle: nil), forCellReuseIdentifier: "OverviewBeforeCell")
		tableView.registerNib(UINib(nibName: "OverviewAfterCell", bundle: nil), forCellReuseIdentifier: "OverviewAfterCell")
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableViewAutomaticDimension
	}
	
	// MARK: - tableview
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		return 6
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: OverviewCell
		switch indexPath.row {
			case 0: cell = tableView.dequeueReusableCellWithIdentifier("OverviewRatingCell", forIndexPath: indexPath) as! OverviewRatingCell
			case 1: cell = tableView.dequeueReusableCellWithIdentifier("OverviewReviewCell", forIndexPath: indexPath) as! OverviewReviewCell
			case 2: cell = tableView.dequeueReusableCellWithIdentifier("OverviewEnrolledCell", forIndexPath: indexPath) as! OverviewEnrolledCell
			case 3: cell = tableView.dequeueReusableCellWithIdentifier("OverviewLocationCell", forIndexPath: indexPath) as! OverviewLocationCell
			case 4: cell = tableView.dequeueReusableCellWithIdentifier("OverviewBeforeCell", forIndexPath: indexPath) as! OverviewBeforeCell
			case 5: cell = tableView.dequeueReusableCellWithIdentifier("OverviewAfterCell", forIndexPath: indexPath) as! OverviewAfterCell
			default: cell = tableView.dequeueReusableCellWithIdentifier("OverviewRatingCell", forIndexPath: indexPath) as! OverviewRatingCell
		}
		cell.overviewInfo = demoData
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
}

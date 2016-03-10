//
//  Review.swift
//  Greatschools
//
//  Created by Jint on 3/9/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Greycats

class ReviewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	var demoData: [ReviewInfo]!
	
	// MARK: - override
	
	override func viewDidLoad() {
		super.viewDidLoad()
		demoData = ReviewInfo.demoData
		tableView.registerNib(UINib(nibName: "ReviewHeader", bundle: nil), forCellReuseIdentifier: "ReviewHeader")
		tableView.registerNib(UINib(nibName: "ReviewCell", bundle: nil), forCellReuseIdentifier: "ReviewCell")
		tableView.estimatedRowHeight = 297
		tableView.rowHeight = UITableViewAutomaticDimension
	}
	
	// MARK: - tableview
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		return demoData.count+1
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		if indexPath.row == 0 {
			let cell = tableView.dequeueReusableCellWithIdentifier("ReviewHeader", forIndexPath: indexPath) as! ReviewHeader
			cell.reviewTotalInfo = ReviewTotalInfo.demoData
			return cell
		} else {
			let cell = tableView.dequeueReusableCellWithIdentifier("ReviewCell", forIndexPath: indexPath) as! ReviewCell
			cell.reviewInfo = demoData[indexPath.row-1]
			return cell
		}
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
}

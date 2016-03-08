//
//  Search.swift
//  Greatschools
//
//  Created by Jint on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Greycats

class SearchViewController: UIViewController{
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var navRightItem: UIBarButtonItem!
	
	var segmentId: Int = 0
	var segmentChanged: Bool = false
	var isMapView: Bool = false
	var mapView: MapView!
	var demoData: [SchoolInfo]!

	// MARK: - override
	
	override func viewDidLoad() {
		super.viewDidLoad()
		demoData = SchoolInfo.demoData
		tableView.registerNib(UINib(nibName: "SchoolInfoCell", bundle: nil), forCellReuseIdentifier: "SchoolInfoCell")
		mapView = MapView(frame: CGRectMake(0, 20+44+44, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-20-44-44-49))
	}
	
	// MARK: - tableview
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int
	{
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return demoData.count
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 144
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
		let cell = tableView.dequeueReusableCellWithIdentifier("SchoolInfoCell", forIndexPath: indexPath) as! SchoolInfoCell
		cell.schoolInfo = demoData[indexPath.row]
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
	{
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
	// MARK: - gesture
	
	@IBAction func handleSwipeFrom(sender: UISwipeGestureRecognizer) {
		segmentChanged = false
		if sender.direction == .Left {
			if segmentId < 2 {
				segmentId++
				segmentChanged = true
			}
		} else if sender.direction == .Right {
			if segmentId > 0 {
				segmentId--
				segmentChanged = true
			}
		}
		if segmentChanged {
			switch segmentId {
				case 1: demoData.sortInPlace{ $0.name < $1.name }
				case 2: demoData.sortInPlace{ $0.rateInfo.rate > $1.rateInfo.rate }
				default: demoData.sortInPlace{ $0.miles < $1.miles }
			}
			tableView.reloadData()
		}
	}
	
	// MARK: - nav
	
	@IBAction func ChangeSearchView(sender: AnyObject) {
		if isMapView {
			navRightItem.image = UIImage(named: "Map")
			isMapView = false
			mapView.removeFromSuperview()
		} else {
			navRightItem.image = UIImage(named: "List")
			isMapView = true
			mapView.demoData = demoData
			self.view.addSubview(mapView)
		}
	}
	
	// MARK: - search
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		if searchText == "" {
			demoData = SchoolInfo.demoData
		} else {
			demoData = SchoolInfo.demoData.filter{ $0.name.containsString(searchText) }
		}
		tableView.reloadData()
		mapView.demoData = demoData
		mapView.resetData()
	}
}
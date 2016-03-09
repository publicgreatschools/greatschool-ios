//
//  Search.swift
//  Greatschools
//
//  Created by Jint on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Greycats

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var gradientView: GradientView!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchView: SearchView!
	@IBOutlet weak var navRightItem: UIBarButtonItem!
	@IBOutlet weak var leftConstraint: NSLayoutConstraint!
	
	var segmentId: Int = 0
	var segmentChanged: Bool = false
	var isMapView: Bool = false
	var mapView: MapView!
	var demoData: [SchoolInfo]!
	var buttons: [UIButton] = []
	// MARK: - override
	
	override func viewDidLoad() {
		super.viewDidLoad()
		demoData = SchoolInfo.demoData
		tableView.registerNib(UINib(nibName: "SchoolInfoCell", bundle: nil), forCellReuseIdentifier: "SchoolInfoCell")
		mapView = MapView(frame: CGRectMake(0, 160, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame) - 160))
		mapView.hidden = true
		view.addSubview(mapView)
		
		for subview in gradientView.subviews {
			if let button = subview as? UIButton {
				buttons.append(button)
			}
		}
	}
	
	// MARK: - tableview
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return demoData.count
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 144
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 12
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("SchoolInfoCell", forIndexPath: indexPath) as! SchoolInfoCell
		cell.schoolInfo = demoData[indexPath.row]
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
	// MARK: - gesture
	
	@IBAction func selectFilter(sender:AnyObject) {
		if let btn = sender as? UIButton {
			let index = btn.tag - 1
			leftConstraint.constant = CGFloat(index) * CGRectGetWidth(view.frame) / 3.0 + CGRectGetWidth(view.frame) * 0.1 / 6.0
			UIView.animateWithDuration(0.2) {
				self.view.layoutIfNeeded()
			}
			for button in buttons {
				button.selected = button.tag == btn.tag
				button.alpha = button.selected ? 1 : 0.77
				button.titleLabel?.font = button.selected ? UIFont.boldFontOfSize(13) : UIFont.semiBoldFontOfSize(13)
			}
		}
	}
	
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
			navRightItem.original = true
			isMapView = false
			mapView.hidden = true
		} else {
			navRightItem.image = UIImage(named: "List")
			navRightItem.original = true
			isMapView = true
			mapView.demoData = demoData
			mapView.hidden = false
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
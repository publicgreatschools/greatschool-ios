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
	
	var sortId: Int = 1
	var isMapView: Bool = false
	var mapView: MapView!
	var demoData: [SchoolInfo]!
	var buttons: [UIButton] = []
	
	// MARK: - override
	
	override func viewDidLoad() {
		super.viewDidLoad()
		demoData = SchoolInfo.demoData
		demoData.sortInPlace{ $0.miles < $1.miles }
		tableView.registerNib(UINib(nibName: "SchoolInfoCell", bundle: nil), forCellReuseIdentifier: "SchoolInfoCell")
		mapView = MapView(frame: CGRectMake(0, 160, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame) - 160))
		
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
			self.changeSelectButton(btn.tag)
		}
	}
	
	@IBAction func handleSwipeFrom(sender: UISwipeGestureRecognizer) {
		if sender.direction == .Left {
			if sortId < 3 {
				sortId++
			}
		} else if sender.direction == .Right {
			if sortId > 1 {
				sortId--
			}
		}
		self.changeSelectButton(sortId)
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
		navRightItem.original = true
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
	
	// MARK: - private
	
	private func changeSelectButton(cuttentTag: Int) {
		leftConstraint.constant = CGFloat(cuttentTag-1) * CGRectGetWidth(view.frame) / 3.0 + CGRectGetWidth(view.frame) * 0.1 / 6.0
		UIView.animateWithDuration(0.2) {
			self.view.layoutIfNeeded()
		}
		for button in buttons {
			button.selected = button.tag == cuttentTag
			button.alpha = button.selected ? 1 : 0.77
			button.titleLabel?.font = button.selected ? UIFont.boldFontOfSize(13) : UIFont.semiBoldFontOfSize(13)
		}
		self.sortData(cuttentTag)
	}
	
	private func sortData(sortId: Int) {
		switch sortId {
		case 2: demoData.sortInPlace{ $0.name < $1.name }
		case 3: demoData.sortInPlace{ $0.rateInfo.rate > $1.rateInfo.rate }
		default: demoData.sortInPlace{ $0.miles < $1.miles }
		}
		tableView.reloadData()
	}
}
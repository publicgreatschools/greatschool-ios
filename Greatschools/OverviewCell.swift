//
//  OverviewCell.swift
//  Greatschools
//
//  Created by Jint on 3/9/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class OverviewRatingCell: UITableViewCell {
	@IBOutlet weak var view: UIView!
	@IBOutlet weak var rateBackground: UIImageView!
	@IBOutlet weak var rate: UILabel!
	
	var overviewInfo: OverviewInfo! {
		didSet {
			let imageTemplate = UIImage(named: "rate_background")!.imageWithRenderingMode(.AlwaysTemplate)
			rateBackground.image = imageTemplate
			rateBackground.tintColor = overviewInfo.schoolRate.color
			rate.text = "\(overviewInfo.schoolRate.rate)"
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewReviewCell: UITableViewCell {
	@IBOutlet weak var view: UIView!
	@IBOutlet weak var rateBackground: UIImageView!
	@IBOutlet weak var rate: UILabel!
	@IBOutlet weak var star: Stars!
	
	var overviewInfo: OverviewInfo! {
		didSet {
			let imageTemplate = UIImage(named: "rate_background")!.imageWithRenderingMode(.AlwaysTemplate)
			rateBackground.image = imageTemplate
			rateBackground.tintColor = overviewInfo.schoolRate.color
			rate.text = "\(overviewInfo.schoolRate.rate)"
			star.starInfo = overviewInfo.starInfo
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewEnrolledCell: UITableViewCell {
	@IBOutlet weak var view: UIView!
	
	var overviewInfo: OverviewInfo! {
		didSet {
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewLocationCell: UITableViewCell {
	@IBOutlet weak var view: UIView!
	
	var overviewInfo: OverviewInfo! {
		didSet {
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewBeforeCell: UITableViewCell {
	@IBOutlet weak var view: UIView!
	
	var overviewInfo: OverviewInfo! {
		didSet {
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewAfterCell: UITableViewCell {
	@IBOutlet weak var view: UIView!
	
	var overviewInfo: OverviewInfo! {
		didSet {
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}


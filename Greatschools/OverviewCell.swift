//
//  OverviewCell.swift
//  Greatschools
//
//  Created by Jint on 3/9/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class OverviewCell: UITableViewCell {
	var overviewInfo: OverviewInfo! { didSet{} }
}

class OverviewRatingCell: OverviewCell {
	@IBOutlet weak var view: UIView!
	@IBOutlet weak var rateBackground: UIImageView!
	@IBOutlet weak var rate: UILabel!
	
	override var overviewInfo: OverviewInfo! {
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

class OverviewReviewCell: OverviewCell {
	@IBOutlet weak var view: UIView!
	@IBOutlet weak var rateBackground: UIImageView!
	@IBOutlet weak var rate: UILabel!
	@IBOutlet weak var star: Stars!
	
	override var overviewInfo: OverviewInfo! {
		didSet {
			let imageTemplate = UIImage(named: "rate_background")!.imageWithRenderingMode(.AlwaysTemplate)
			rateBackground.image = imageTemplate
			rateBackground.tintColor = overviewInfo.reviewRate.color
			rate.text = "\(overviewInfo.reviewRate.rate)"
			star.starInfo = overviewInfo.starInfo
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewEnrolledCell: OverviewCell {
	@IBOutlet weak var view: UIView!
	
	override var overviewInfo: OverviewInfo! {
		didSet {
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewLocationCell: OverviewCell {
	@IBOutlet weak var view: UIView!
	
	override var overviewInfo: OverviewInfo! {
		didSet {
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewBeforeCell: OverviewCell {
	@IBOutlet weak var view: UIView!
	
	override var overviewInfo: OverviewInfo! {
		didSet {
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

class OverviewAfterCell: OverviewCell {
	@IBOutlet weak var view: UIView!
	
	override var overviewInfo: OverviewInfo! {
		didSet {
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}


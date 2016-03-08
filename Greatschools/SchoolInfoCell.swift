//
//  SchoolInfoCell.swift
//  Greatschools
//
//  Created by Jint on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class SchoolInfoCell: UITableViewCell {
	@IBOutlet weak var schoolName: UILabel!
	@IBOutlet weak var schoolAddress: UILabel!
	@IBOutlet weak var schoolMiles: UILabel!
	@IBOutlet weak var rateBackground: UIImageView!
	@IBOutlet weak var starView: Stars!
	@IBOutlet weak var rate: UILabel!
	@IBOutlet weak var reviews: UILabel!
	@IBOutlet weak var bgView: UIView!
	
	var schoolInfo: SchoolInfo! {
		didSet {
			schoolName.text = schoolInfo.name
			schoolAddress.text = schoolInfo.address
			schoolMiles.text = "\(schoolInfo.miles) Miles"
			let imageTemplate = UIImage(named: "rate_background")!.imageWithRenderingMode(.AlwaysTemplate)
			rateBackground.image = imageTemplate
			rateBackground.tintColor = schoolInfo.rateInfo.color
			rate.text = "\(schoolInfo.rateInfo.rate)"
			starView.starInfo = schoolInfo.starInfo
			reviews.text = "\(schoolInfo.reviews) reviews"
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = bgView.frame
	}
}


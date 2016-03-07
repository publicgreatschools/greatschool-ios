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
	
	var schoolInfo: SchoolInfo! {
		didSet {
			schoolName.text = schoolInfo.name
			schoolAddress.text = schoolInfo.address
			schoolMiles.text = "\(schoolInfo.miles) Miles"
			let image = UIImage(named: "rate_background")!.imageWithRenderingMode(.AlwaysTemplate)
			rateBackground.image = image
			rateBackground.tintColor = schoolInfo.rateInfo.color
			rate.text = "\(schoolInfo.rateInfo.rate)"
			reviews.text = "\(schoolInfo.reviews) reviews"
		}
	}
}


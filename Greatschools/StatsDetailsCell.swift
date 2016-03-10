//
//  StatsDetailsCell.swift
//  Greatschools
//
//  Created by SunyQin on 3/9/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class StatsDetailsCell: UITableViewCell {
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var countLabel: UILabel!
	@IBOutlet weak var container: UIView!
	
	var info: StatsInfo! {
		didSet {
			iconImageView.image = UIImage(named: info.iconImage)
			titleLabel.text = info.name
			countLabel.text = info.count
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = container.frame
	}
}

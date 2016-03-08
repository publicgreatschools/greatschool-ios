//
//  AppCell.swift
//  Greatschools
//
//  Created by SunyQin on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {
	@IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var container: UIView!
	
	var info: AppInfo? {
		didSet {
			if let info = info {
				iconImageView.image = UIImage(named: info.imageName)
				nameLabel.text = info.name
			}
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = container.frame
	}
}

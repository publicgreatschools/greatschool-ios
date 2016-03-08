//
//  CardCell.swift
//  Greatschools
//
//  Created by SunyQin on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
	@IBOutlet weak var container: UIView!
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = container.frame
	}
}
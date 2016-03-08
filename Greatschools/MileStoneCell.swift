//
//  MileStoneCell.swift
//  Greatschools
//
//  Created by SunyQin on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class MileStoneCell: UITableViewCell {
	@IBOutlet weak var container: MileStone!
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = container.frame
	}
}

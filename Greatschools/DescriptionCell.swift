//
//  DescriptionCell.swift
//  Greatschools
//
//  Created by SunyQin on 3/10/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit
import Greycats

class DescriptionCell: UITableViewCell {
	@IBOutlet weak var titleLabel: KernLabel!
	@IBOutlet weak var container: UIView!
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = container.frame
	}
}

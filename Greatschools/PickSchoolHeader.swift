//
//  PickSchoolHeader.swift
//  Greatschools
//
//  Created by SunyQin on 3/8/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class PickSchoolHeader: UITableViewHeaderFooterView {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var topLayoutConstraint: NSLayoutConstraint!
	var isFirstSection: Bool = true {
		didSet {
			topLayoutConstraint.constant = isFirstSection ? 20 : 0
		}
	}
}

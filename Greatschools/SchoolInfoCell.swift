//
//  SchoolInfoCell.swift
//  Greatschools
//
//  Created by Jint on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class SchoolInfoCell: UITableViewCell {
	@IBOutlet weak var infoView: SchoolInfoView!
	
	var schoolInfo: SchoolInfo! {
		didSet {
			infoView.schoolInfo = schoolInfo
		}
	}
}


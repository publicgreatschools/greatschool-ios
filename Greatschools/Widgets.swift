//
//  Widgets.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

class TabBarItem: UITabBarItem {
	init(title: String, imageName: String) {
		super.init()
		
		self.title = title
		image = UIImage(named: imageName + "_inactive")?.imageWithRenderingMode(.AlwaysOriginal)
		selectedImage = UIImage(named: imageName + "_active")?.imageWithRenderingMode(.AlwaysOriginal)
		titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
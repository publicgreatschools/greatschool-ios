//
//  NearByViewController.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit
import Greycats

class NearByViewController: ViewController {
	
	@IBOutlet weak var gredientView: GradientView!
	@IBOutlet weak var header: UIImageView!
	@IBOutlet weak var countLabel: GradientLabel!
	@IBOutlet weak var descriptionLabel: KernLabel!
	@IBOutlet weak var exploreButton: UIButton!
	@IBOutlet weak var article: Article!
	
	@IBAction func explore(sender: AnyObject) {
		performSegueWithIdentifier("pick", sender: nil)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let neighBorhood = "NEIGHBORHOOD"
		let string = "SCHOOLS IN THIS " + neighBorhood
		let attributedString = NSMutableAttributedString(string: string)
		attributedString.setAttributes([NSFontAttributeName: UIFont.boldFontOfSize(15), NSForegroundColorAttributeName: UIColor.lightGreenColor(), NSUnderlineStyleAttributeName: 1], range: NSMakeRange(string.length - neighBorhood.length, neighBorhood.length))
		descriptionLabel.attributedText = attributedString
	}
}
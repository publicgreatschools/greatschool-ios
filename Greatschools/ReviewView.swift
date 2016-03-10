//
//  ReviewCell.swift
//  Greatschools
//
//  Created by Jint on 3/9/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Greycats

class ReviewCell: UITableViewCell {
	@IBOutlet weak var view: UIView!
	@IBOutlet weak var star: Stars!
	@IBOutlet weak var date: UILabel!
	@IBOutlet weak var comment: UILabel!
	@IBOutlet weak var pic: UIImageView!
	@IBOutlet weak var submit: UILabel!
	
	var reviewInfo: ReviewInfo! {
		didSet {
			star.starInfo = reviewInfo.starInfo
			date.text = reviewInfo.date
			comment.text = reviewInfo.comment
			if reviewInfo.imageName.length > 0 {
				pic.image = UIImage(named: reviewInfo.imageName)
			} else {
				pic.removeFromSuperview()
			}
			submit.text = "Submitted by " + reviewInfo.reviewerName
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}


@IBDesignable
class ReviewBar: NibView {
	@IBOutlet weak var count: UILabel!
	@IBOutlet weak var barImage: UIImageView!
	
	var reviewBarInfo: ReviewBarInfo! {
		didSet {
			count.text = "\(reviewBarInfo.count)"
			barImage.image = UIImage(named: "ReviewBar\(reviewBarInfo.colorID)")
		}
	}
}


class ReviewHeader: UITableViewCell {
	@IBOutlet weak var view: UIView!
	@IBOutlet weak var star: Stars!
	@IBOutlet var reviewBars: [ReviewBar]!
	
	var reviewTotalInfo: ReviewTotalInfo! {
		didSet {
			star.starInfo = reviewTotalInfo.starInfo
			reviewBars.enumerate().forEach { i, bar in
				bar.reviewBarInfo = reviewTotalInfo.barInfos[i]
			}
		}
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		selectedBackgroundView?.frame = view.frame
	}
}

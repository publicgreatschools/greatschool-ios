//
//  Widgets.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit
import Greycats

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

@IBDesignable
class CardScrollView: NibView {
	override var nibName: String { return "CardScrollView" }
}

@IBDesignable
class SearchView: NibView {
	override var nibName: String { return "SearchView" }
	@IBOutlet weak var textField: UITextField!
}

@IBDesignable
class Article: NibView {
	override var nibName: String { return "Article" }
}

@IBDesignable
class MileStone: NibView {
	override var nibName: String { return "MileStone" }
}

@IBDesignable
class DetailHeader: NibView {
	override var nibName: String { return "DetailHeader" }
}

@IBDesignable
class CustomSegment: NibView {
	override var nibName: String { return "CustomSegment" }
	@IBOutlet weak var first: UIButton!
	@IBOutlet weak var second: UIButton!
	@IBOutlet weak var third: UIButton!
	@IBOutlet weak var indicator: UIView!
	@IBOutlet weak var leftConstraint: NSLayoutConstraint!
	@IBOutlet weak var indicatorConstraint: NSLayoutConstraint!
	@IBInspectable var unselectedTextAlpha: CGFloat = 0
	@IBInspectable var text1: String = "" { didSet { first.setTitle(text1, forState: .Normal) } }
	@IBInspectable var text2: String = "" { didSet { second.setTitle(text2, forState: .Normal) } }
	@IBInspectable var text3: String = "" { didSet { third.setTitle(text3, forState: .Normal) } }
	@IBInspectable var textColor: UIColor = UIColor.whiteColor() {
		didSet {
			first.setTitleColor(textColor, forState: .Normal)
			second.setTitleColor(textColor, forState: .Normal)
			third.setTitleColor(textColor, forState: .Normal)
		}
	}
	@IBInspectable var indicatorColor: UIColor = UIColor.whiteColor() { didSet { indicator.backgroundColor = indicatorColor } }
	@IBInspectable var indicatorHeight: CGFloat = 2.0 { didSet { indicatorConstraint.constant = indicatorHeight } }
	var defaultLeftMargin: CGFloat = 0
	var selectedTextFont: UIFont = UIFont.boldFontOfSize(14)
	var textFont: UIFont = UIFont.semiBoldFontOfSize(14) {
		didSet {
			first.titleLabel?.font = textFont
			second.titleLabel?.font = textFont
			third.titleLabel?.font = textFont
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		defaultLeftMargin = CGRectGetWidth(first.frame) * (1.0 - 0.8) / 2.0
		leftConstraint.constant = defaultLeftMargin
	}
	
	var onSelected: ((Int)->())?
	@IBAction func tapSegement(sender: AnyObject) {
		if let btn = sender as? UIButton {
			for (i, button) in [first, second, third].enumerate() {
				button.selected = i == btn.tag - 1
				button.titleLabel?.font = button.selected ? selectedTextFont : textFont
				button.alpha = button.selected ? 1 : unselectedTextAlpha
			}
			leftConstraint.constant = defaultLeftMargin + CGRectGetWidth(first.frame) * CGFloat(btn.tag - 1)
			UIView.animateWithDuration(0.2, animations: {
				self.layoutIfNeeded()
				}, completion: { finish in
					self.onSelected?(btn.tag - 1)
			})
		}
	}
}

@IBDesignable
class CartoonButton: NibView {
	override var nibName: String { return "CartoonButton" }
	@IBOutlet weak var textLabel: KernLabel!
	@IBOutlet weak var cartoon: UIButton!
	@IBOutlet weak var badgeButton: UIButton!
	@IBInspectable var text: String = "" { didSet { textLabel.text = text } }
	@IBInspectable var imageName: String? {
		didSet {
			if let imageName = imageName {
				cartoon.setImage(UIImage(named: imageName), forState: .Normal)
			}
		}
	}
	@IBInspectable var badge: Int = 0 {
		didSet {
			badgeButton.hidden = badge == 0
			badgeButton.setTitle("\(badge)", forState: .Normal)
		}
	}
}

@IBDesignable
class GradientLabel: GradientView {
	private var attributedText: [NSAttributedString]!
	@IBInspectable var text: String = "" { didSet { updateText() } }
	@IBInspectable var fontSize: CGFloat = 120 { didSet { updateText() } }
	@IBInspectable var strokeColor: UIColor = UIColor.clearColor() { didSet { updateText() } }
	@IBInspectable var strokeWidth: CGFloat = 0 { didSet { updateText() } }
	
	func updateText() {
		attributedText = text.componentsSeparatedByString("\n").map {
			NSAttributedString(string: $0, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(fontSize)])
		}
		setNeedsDisplay()
	}
	
	override func drawRect(rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
		CGContextSaveGState(context)
		
		attributedText.enumerate().forEach { i, text in
			CGContextRestoreGState(context)
			CGContextSaveGState(context)
			CGContextTranslateCTM(context, 0.0, rect.size.height)
			CGContextScaleCTM(context, 1.0, -1.0)
			let line = CTLineCreateWithAttributedString(text)
			let trect = CTLineGetBoundsWithOptions(line, .UseGlyphPathBounds)
			CGContextSetTextPosition(context, (rect.size.width - trect.size.width) / 2, (rect.size.height - trect.size.height) / 2)
			CGContextSetTextDrawingMode(context, .Clip)
			CTLineDraw(line, context)
			drawGradient(context, rect: rect)
			
		}
		if !CGContextIsPathEmpty(context) {
			CGContextClip(context)
		}
		CGContextRestoreGState(context)
	}
}
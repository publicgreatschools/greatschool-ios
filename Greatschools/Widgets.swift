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

class Article: NibView {
	override var nibName: String { return "Article" }
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
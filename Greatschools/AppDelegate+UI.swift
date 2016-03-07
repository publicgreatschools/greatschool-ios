//
//  AppDelegate+UI.swift
//  Greatschools
//
//  Created by SunyQin on 3/7/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import UIKit

extension AppDelegate {
	
	func perform(controller: UIViewController) {
		if let previousRootViewController = window?.rootViewController {
			previousRootViewController.dismissViewControllerAnimated(false) {
				previousRootViewController.view.removeFromSuperview()
			}
		}
		window?.rootViewController = controller
		UIView.transitionWithView(window!, duration: 0.25, options: .TransitionCrossDissolve, animations: { _ in
			self.window?.rootViewController = controller
			}, completion: nil)
	}
	
	func loadRootView() {
		loadHomeView()
	}
	
	func loadHomeView() {
		if let tabbarController = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as? TabBarController {
			self.tabbarController = tabbarController
			perform(tabbarController)
		}
	}
	
	func loadOnboardingView() {
		self.tabbarController = nil
		let viewController = UIStoryboard(name: "Onboarding", bundle: nil).instantiateInitialViewController()
		perform(viewController!)
	}
}
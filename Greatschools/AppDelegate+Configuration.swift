//
//  AppDelegate+Configure.swift
//  Greatschools
//
//  Created by SunyQin on 3/10/16.
//  Copyright © 2016 ilabs. All rights reserved.
//

import Foundation
import HockeySDK

extension AppDelegate {
	func loadConfiguration(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) {
		
		if (!IsSimulator) {
			#if !DEBUG
				let hockeyManager = BITHockeyManager.sharedHockeyManager()
				hockeyManager.configureWithIdentifier(HOCKEY_APP_ID)
				hockeyManager.crashManager.crashManagerStatus = BITCrashManagerStatus.AutoSend
				hockeyManager.startManager()
				hockeyManager.authenticator.authenticateInstallation()
			#endif
		}
	}
}
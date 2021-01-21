//
//  ShareClientSettingsNavigationController.swift
//  ShareClientUI
//
//  Created by Nathaniel Hamming on 2021-01-15.
//  Copyright © 2021 Mark Wilson. All rights reserved.
//

import UIKit
import HealthKit
import LoopKit
import LoopKitUI

public class ShareClientSettingsNavigationController: SettingsNavigationViewController, PreferredGlucoseUnitObserver {

    private var rootViewController: ShareClientSettingsViewController

    init(rootViewController: ShareClientSettingsViewController) {
        self.rootViewController = rootViewController
        super.init(rootViewController: rootViewController)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func preferredGlucoseUnitDidChange(to preferredGlucoseUnit: HKUnit) {
        rootViewController.preferredGlucoseUnitDidChange(to: preferredGlucoseUnit)
    }
}

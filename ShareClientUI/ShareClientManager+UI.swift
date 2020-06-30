//
//  ShareClientManager+UI.swift
//  Loop
//
//  Copyright © 2018 LoopKit Authors. All rights reserved.
//

import LoopKit
import LoopKitUI
import HealthKit
import ShareClient

extension ShareClientManager: CGMManagerUI {
    public static func setupViewController() -> (UIViewController & CGMManagerSetupViewController & CompletionNotifying)? {
        return ShareClientSetupViewController()
    }

    public func settingsViewController(for glucoseUnit: HKUnit) -> (UIViewController & CompletionNotifying) {
        let settings = ShareClientSettingsViewController(cgmManager: self, glucoseUnit: glucoseUnit, allowsDeletion: true)
        let nav = SettingsNavigationViewController(rootViewController: settings)
        return nav
    }

    public var smallImage: UIImage? {
        return nil
    }
    
    // TODO Placeholder. This functionality will come with LOOP-1311
    public var cgmStatusHighlight: DeviceStatusHighlight? {
        return nil
    }
    
    // TODO Placeholder. This functionality will come with LOOP-1311
    public var cgmStatusProgress: DeviceStatusProgress? {
        return nil
    }
}

//
//  ShareGlucose+GlucoseKit.swift
//  Naterade
//
//  Created by Nathan Racklyeft on 5/8/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import Foundation
import HealthKit
import LoopKit


extension ShareGlucose: GlucoseValue {
    public var startDate: Date {
        return timestamp
    }

    public var quantity: HKQuantity {
        return HKQuantity(unit: .milligramsPerDeciliter, doubleValue: Double(glucose))
    }
}


extension ShareGlucose: SensorDisplayable {
    public var isStateValid: Bool {
        return glucose >= 39
    }

    public var trendType: GlucoseTrend? {
        return GlucoseTrend(rawValue: Int(trend))
    }

    public var isLocal: Bool {
        return false
    }
}

extension SensorDisplayable {
    public var stateDescription: String {
        if isStateValid {
            return LocalizedString("OK", comment: "Sensor state description for the valid state")
        } else {
            return LocalizedString("Needs Attention", comment: "Sensor state description for the non-valid state")
        }
    }
}

// TODO Placeholders. This functionality will come with LOOP-1311
extension ShareGlucose: CGMManagerStatusReport {
    public var glucoseValueType: GlucoseValueType? {
        return nil
    }
    
    public var message: String? {
        return nil
    }
    
    public var messageType: MessageType? {
        return nil
    }
    
    public var displayProgress: Bool {
        return false
    }
    
    public var progressPercentCompleted: Double? {
        return nil
    }
}

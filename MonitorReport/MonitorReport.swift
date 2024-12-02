//
//  MonitorReport.swift
//  MonitorReport
//
//  Created by Devin Hasler.
//

import DeviceActivity
import SwiftUI

@main
struct MonitorReport: DeviceActivityReportExtension {
    var body: some DeviceActivityReportScene {
        // Create a report for each DeviceActivityReport.Context that your app supports.
        ActivityReport { activity in
            TotalActivityView(deviceActivity: activity)
        }
        // Add more reports here...
    }
}

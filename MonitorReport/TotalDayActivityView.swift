//
//  TotalActivityReport.swift
//  MonitorReport
//
//  Created by Devin Hasler.
//

import DeviceActivity
import SwiftUI

extension DeviceActivityReport.Context {
    // If your app initializes a DeviceActivityReport with this context, then the system will use
    // your extension's corresponding DeviceActivityReportScene to render the contents of the
    // report.
    static let totalActivity = Self("TotalActivity")
}

struct ActivityReport: DeviceActivityReportScene {
    
    // Define which context your scene will represent.
    let context: DeviceActivityReport.Context = .totalActivity
    
    // Define the custom configuration and the resulting view for this report.
    let content: (DeviceActivity) -> TotalActivityView
    
    
    func makeConfiguration(representing data: DeviceActivityResults<DeviceActivityData>) async -> DeviceActivity {
        var list: [AppReport] = []
        var totalDeviceActivityDuration: TimeInterval = 0
        var appCount = 0 // Counter to limit the number of apps

        // Iterate through the data to calculate durations
        for await activityData in data {
            for await segment in activityData.activitySegments {
                totalDeviceActivityDuration += segment.totalActivityDuration

                // Process individual apps and their durations
                for await category in segment.categories {
                    for await app in category.applications {
                        // Break if we already processed 10 apps
                        if appCount >= 1000 {
                            break
                        }

                        let appName = (app.application.localizedDisplayName ?? "nil")
                        let bundle = (app.application.bundleIdentifier ?? "nil")
                        let duration = app.totalActivityDuration
                        let app = AppReport(id: bundle, name: appName, duration: duration)
                        list.append(app)

                        appCount += 1 // Increment the counter
                    }

                    // Break outer loop if we already processed 10 apps
                    if appCount >= 1000 {
                        break
                    }
                }

                if appCount >= 1000 {
                    break
                }
            }

            if appCount >= 1000 {
                break
            }
        }

        return DeviceActivity(
            totalDuration: totalDeviceActivityDuration,
            apps: list
        )
    }
    
    
    
}

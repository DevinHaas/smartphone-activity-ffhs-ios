//
//  DeviceActivityReportAdapter.swift
//  DeviceActivityApp
//
//  Created by Devin Hasler.
//

import SwiftUI
import DeviceActivity

struct DeviceActivityWeeklyReportAdapter: View {
    
    @State private var context: DeviceActivityReport.Context = .init(rawValue: "TotalActivity")
    @State private var filter = DeviceActivityFilter(
        segment: .weekly(
            during: Calendar.current.dateInterval(
                of: .weekOfYear, for: .now
            )!
        ),
        users: .all,
        devices: .init([.iPad])
    )
    
    var body: some View {
        ZStack {
            DeviceActivityReport(context, filter: filter)
        }
    }
    
}

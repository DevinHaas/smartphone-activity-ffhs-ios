//
//  TotalActivityView.swift
//  MonitorReport
//
//  Created by Devin Hasler.
//

import SwiftUI

struct TotalActivityView: View {
    
    var deviceActivity: DeviceActivity
    
    var body: some View {
        ActivitiesView(activities: deviceActivity)
    }
    
}

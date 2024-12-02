//
//  ActivitiesView.swift
//  Monitor
//
//  Created by Devin Hasler 
//

import SwiftUI

struct ActivitiesView: View {
    
    var activities: DeviceActivity
    
    var body: some View {
        
        VStack {
            Text("Total Activity: \(formatTime(activities.totalDuration))")
        }
        
    }
    
    // Helper function to format TimeInterval into "Xh Ym" format
    func formatTime(_ duration: TimeInterval) -> String {
        let hours = Int(duration) / 3600
        let minutes = (Int(duration) % 3600) / 60
        return "\(hours)h \(minutes)m"
    }
    
}


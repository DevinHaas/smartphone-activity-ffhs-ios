//
//  DeviceActivityAppApp.swift
//  DeviceActivityApp
//
//  Created by Devin Hasler.
//

import SwiftUI

@main
struct DeviceActivityApp: App {
    
    @State var showReports = false
    
    let requestAuthorization = RequestAuthorization()
    
    var body: some Scene {
        WindowGroup {
            
            VStack {
                if showReports {
                    ReportsView()
                }
            }.onAppear {
                
                Task {
                    showReports = await requestAuthorization.requestFamilyControls(for: .individual)
                    debugPrint("\(showReports)")
                }
                
            }
            
        }
    }
    
}

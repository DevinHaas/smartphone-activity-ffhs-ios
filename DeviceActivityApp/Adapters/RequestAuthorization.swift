//
//  RequestAuthorization.swift
//  DeviceActivityApp
//
//  Created by Devin Hasler
//

import Foundation
import FamilyControls

struct RequestAuthorization {
    
    private let center = AuthorizationCenter.shared
    
    func requestFamilyControls(for value: FamilyControlsMember) async -> Bool {
        
        do {
            try await center.requestAuthorization(for: value)
            return true
        } catch(let error) {
            debugPrint(error)
            return false
        }
        
    }
    
}

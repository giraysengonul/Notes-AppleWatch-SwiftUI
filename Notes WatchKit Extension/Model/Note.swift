//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by hakkı can şengönül on 24.06.2022.
//

import Foundation
struct Note : Codable , Identifiable {
    
    let id : UUID
    let text : String
}

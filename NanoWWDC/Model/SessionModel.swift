//
//  SessionModel.swift
//  NanoWWDC
//
//  Created by Henrique Figueiredo Conte on 05/04/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import Foundation

class Session {
    
    var title: String
    var speaker: String
    var hour: String
    var hall: String
    var sessionNumber: Int
    var category: String
    var photo: String
    
    init(title: String, speaker: String, hour: String, hall: String, sessionNumber: Int, category: String, photo: String) {
        self.title = title
        self.speaker = speaker
        self.hour = hour
        self.hall = hall
        self.sessionNumber = sessionNumber
        self.category = category
        self.photo = photo
    
    }
    
}

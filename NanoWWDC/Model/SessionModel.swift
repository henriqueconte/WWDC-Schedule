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
    var date: String
    var hour: String
    var hall: String
    var sessionNumber: Int
    var category: String
    var photo: String
    var sessionDetails: String
    var speakerDetails: String
    
    
    init(title: String, speaker: String, date: String, hour: String, hall: String, sessionNumber: Int, category: String, photo: String, sessionDetails: String, speakerDetails: String) {
        self.title = title
        self.speaker = speaker
        self.date = date
        self.hour = hour
        self.hall = hall
        self.sessionNumber = sessionNumber
        self.category = category
        self.photo = photo
        self.sessionDetails = sessionDetails
        self.speakerDetails = speakerDetails
    }
    
}

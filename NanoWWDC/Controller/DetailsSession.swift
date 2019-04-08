//
//  DetailsSpeaker.swift
//  NanoWWDC
//
//  Created by Vitor Demenighi on 05/04/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import UIKit

class DetailsSession: UITableViewController {
    
    @IBOutlet weak var addToCalendarButton: UIButton!
    @IBOutlet weak var sessionTitleLabel: UILabel!
    @IBOutlet weak var speakerImageView: UIImageView!
    
    @IBOutlet weak var speakerNameLabel: UILabel!
    
    @IBOutlet weak var speakerDetailsLabel: UILabel!
    @IBOutlet weak var dateSessionLabel: UILabel!
    
    @IBOutlet weak var scheduleSession: UILabel!
    
    @IBOutlet weak var hallLabel: UILabel!
    
    @IBOutlet weak var markAsWatchedButton: UIButton!
    
    @IBOutlet weak var sessionDetailsLabel: UILabel!
    
    
    @IBOutlet weak var localImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

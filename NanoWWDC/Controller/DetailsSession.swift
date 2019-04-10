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
    
    @IBOutlet weak var typeSessionLabel: UILabel!
    @IBOutlet weak var hallLabel: UILabel!
    
    @IBOutlet weak var markAsWatchedButton: UIButton!
    
    @IBOutlet weak var sessionDetailsLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    @IBOutlet weak var localImageView: UIImageView!
    
    
    @IBOutlet weak var nextSessionImageView: UIImageView!
    
    
    
    @IBOutlet weak var nextSessionHallLabel: UILabel!
    @IBOutlet weak var nextSessionHourLabel: UILabel!
    @IBOutlet weak var nextSessionNumberLabel: UILabel!
    @IBOutlet weak var nextSessionTypeLabel: UILabel!
    @IBOutlet weak var nextSessionTitleLabel: UILabel!
    @IBOutlet weak var nextSessionSpeaker: UILabel!
    
    
    var isFavorite: Bool = false
    
    var session: Session?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func addToCalendarAction(_ sender: Any) {
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isFavorite {
            favoriteButton.image = UIImage(named: "favorites-select")
            favoriteButton.tintColor = UIColor(red: 1.0, green: 0.76, blue: 0, alpha: 1)
        } 
        
        typeSessionLabel.text = session?.category
        sessionTitleLabel.text = session?.title
        speakerNameLabel.text = session?.speaker
        speakerDetailsLabel.text = session?.speakerDetails
    
        scheduleSession.text = session?.hour
        hallLabel.text = session?.hall
        
        sessionDetailsLabel.text = session?.sessionDetails
        
        addToCalendarButton.layer.cornerRadius = 15
        markAsWatchedButton.layer.cornerRadius = 15
    
        speakerImageView.image = UIImage(named: session!.photo + "2")
        
        
        // next session
        nextSessionImageView.image = UIImage(named: session?.nextSession!.photo ?? "speaker-tim")
        nextSessionTitleLabel.text = session?.nextSession?.title
        nextSessionSpeaker.text = "Speaker: \(session?.nextSession!.speaker ?? "")"
        nextSessionHourLabel.text = session?.nextSession?.hour
        nextSessionHallLabel.text = session?.nextSession?.hall
        nextSessionTypeLabel.text = session?.nextSession?.category
        
        if session?.nextSession?.sessionNumber == 10 {
            nextSessionNumberLabel.text = "Session \(session?.nextSession!.sessionNumber ?? 0)"
        }else {
            nextSessionNumberLabel.text = "Session 0\(session?.nextSession!.sessionNumber ?? 0)"
        }
    
    }
    
    

    
}

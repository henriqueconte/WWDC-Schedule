//
//  ViewController.swift
//  NanoWWDC
//
//  Created by Henrique Figueiredo Conte on 05/04/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var isFavorite: Bool = false
    
    var dates = ["Monday, Jun 3", "Tuesday, Jun 4", "Wednesday, Jun 5"]
    var sessions = [
        Session(title: "WWDC 2019 Keynote", speaker: "Tim Cook", date: "Monday, Jun 3", hour: "14:00 - 16:00", hall: "HALL 2", sessionNumber: 1, category: "feature ❤", photo: "speaker-tim", sessionDetails: "Every year, a great migration is made by one of the world's most mysterious species. To reach this utopian destination, these unique mammals will instinctively embark on a nomadic journey from all corners of the world.", speakerDetails: "Apple CEO  Auburn 🏀 🏈 Duke 🏀 National Parks 🏞️ “Life's most persistent and urgent question is, 'What are you doing for others?'” - MLK"),
        
        Session(title: "Apple Design Awards", speaker: "John Geleynse", date: "Monday, Jun 3", hour: "17:00 - 19:00", hall: "HALL 1", sessionNumber: 2, category: "design 🎨", photo: "speaker-john", sessionDetails: "Join us for an unforgettable award ceremony celebrating developers and their outstanding work. The 2018 Apple Design Awards recognize state of the art iOS, macOS, watchOS, and tvOS apps that reflect excellence in design and innovation.", speakerDetails: "Director of Technology Evangelism & User Experience Evangelist. Specialties: User interface design, visual design, interaction design, human interface design consulting."),
        
        Session(title: "What's new in Swift", speaker: "Slava Pestov", date: "Monday, Jun 3", hour: "19:30-21:00", hall: "HALL 3", sessionNumber: 3, category: "developer 💻", photo: "speaker-slava", sessionDetails: "Hear about the latest advancements in Swift, the safe, fast, and expressive language. Find out about improvements to build times, code size, and runtime performance. Learn how to take advantage of new features in your code that eliminate boilerplate, increase safety and security, and improve your overall development productivity.", speakerDetails: "Working at Apple on the Swift programming language. Key focus areas: Fixing compiler crashers, implementing missing features and edge cases."),
        
        Session(title: "Qualities of a Great Design", speaker: "Lauren Strehlow", date: "Tuesday, Jun 4", hour: "10:00 - 12:00", hall: "HALL 2", sessionNumber: 4, category: "design 🎨", photo: "speaker-lauren", sessionDetails: "Great Design isn't magic, it is crafted with care by real people. Explore the characteristics of great design through the voices of designers from Apple and our developer community. Learn how they take inspiration from everyday life, conceive and refine ideas, and push themselves to design apps and games that can stand the test of time.", speakerDetails: "Lauren Strehlow Creative, strategic, diplomatic thinker who excels in a fast paced, visual environment. Enjoys managing, mentoring and providing creative guidance in high pressure situations. Let's do this."),
        
        Session(title: "What's New in whatchOS", speaker: "Lori Hylan-Cho", date: "Tuesday, Jun 4", hour:  "14:00 - 16:00", hall: "HALL 2", sessionNumber: 5, category: "feature ❤", photo: "speaker-lori", sessionDetails: "WatchOS 5 makes creating great experiences on Apple Watch easier than ever before. Learn about robust capabilities to create rich and interactive notifications, a new background mode and controls for audio playback, shortcuts that bring your apps to the Siri watch face, and more.", speakerDetails: "Lori Hylan-Cho SW Engineering Manager at Apple. Specialties: Assembling and leading highly functional teams, agile software development, iOS engineering & project management, API development & documentation, finding the flaw in any plan."),
        
        Session(title: "Building Faster in Xcode", speaker: "David Owens", date: "Tuesday, Jun 4", hour: "16:00- 18:00", hall: "HALL 3", sessionNumber: 6, category: "developer 💻", photo: "speaker-david", sessionDetails: "none", speakerDetails: "none"),
        
        Session(title: "Apple Pencil Design", speaker: "Guilauma Ardaud", date: "Tuesday, Jun 4", hour: "18:00 - 21:00", hall: "HALL 1", sessionNumber: 7, category: "design 🎨", photo: "speaker-guilauma", sessionDetails: "none", speakerDetails: "none"),
        
        Session(title: "MusicKit on the Web", speaker: "Betim Deva", date: "Wednesday, Jun 5", hour: "10:00 - 12:00", hall: "HALL 2", sessionNumber: 8, category: "developer 💻", photo: "speaker-betim", sessionDetails: "none", speakerDetails: "none"),
        
        Session(title: "Vision with Core ML", speaker: "Frank Doepke", date: "Wednesday, Jun 5", hour: "14:00 - 16:00", hall: "HALL 1", sessionNumber: 9, category: "developer 💻", photo: "speaker-frank", sessionDetails: "none", speakerDetails: "none"),
        
        Session(title: "Prototyping for AR", speaker: "Praveen Sharma", date: "Wednesday, Jun 5", hour: "16:00 - 18:00", hall: "HALL 3", sessionNumber: 10, category: "design 🎨", photo: "speaker-praveen", sessionDetails: "none", speakerDetails: "none")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    
        
        for i in 0..<sessions.count-1 {
            sessions[i].setNextSession(nextSession: sessions[i+1])
        }
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let session = sender as? Session {
            if let nextViewController = segue.destination as? DetailsSession {
                nextViewController.session = session
                nextViewController.isFavorite = isFavorite
            }
        }
    }

    @IBAction func favoriteSession(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(named: "favorites2x"){
            let image = UIImage(named: "favorites-select2x")
            //sender.image = UIImage(named: "favorites-selected2x")
            sender.setBackgroundImage(image, for: .normal)
            isFavorite = true
        }
        else {
            let image = UIImage(named: "favorites2x")
            
            sender.setBackgroundImage(image, for: .normal)
            isFavorite = false
        }
        
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sessionDate = dates[section]
        
        let sessions = self.sessions.filter{ $0.date == sessionDate }
        
        return sessions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dates.count
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        var headerTitle = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 28))
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            let sessionDate = dates[section]
            
            return sessionDate
        }

        
        headerTitle.text = dates[section]
        headerView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerView.addSubview(headerTitle)
        
        
        return headerView
    }

   
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell") as? SessionTableViewCell else {
            return UITableViewCell()
        }
        
        let sessionDate = dates[indexPath.section]
        
        let sessions = self.sessions.filter{ $0.date == sessionDate }
        
        let session = sessions[indexPath.row]
        
        cell.sessionImageView.image = UIImage(named: session.photo)
        
        cell.sessionTitle.text = session.title
        cell.sessionSpeaker.text = "Speaker: \(session.speaker)"
        cell.sessionHour.text = session.hour
        cell.sessionHall.text = session.hall
        cell.sessionHall.textColor = UIColor(red: 1.0, green: 0.17, blue: 0.33, alpha: 1.0)
    
//        cell.cellShadow.layer.shadowColor = UIColor.black.cgColor
//        cell.cellShadow.layer.shadowRadius = 3
//        cell.cellShadow.layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
//        cell.cellShadow.layer.opacity = 1.0
//        cell.cellShadow.layer.masksToBounds = false
        cell.cellShadow.layer.cornerRadius = 10.0
    
        
//        cell.contentView.layer.masksToBounds = false
//        cell.layer.masksToBounds = false
//        cell.cellShadow.setNeedsDisplay()
        
//        cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        cell.layer.shadowRadius = 5.0
//        cell.layer.shadowOffset = CGSize(width: 0, height: 3)
//        cell.layer.opacity = 0.25
//        cell.layer.masksToBounds = false

        
        //cell.cellShadow.layer.shouldRasterize = true
        
        if session.sessionNumber == 10 {
            cell.sessionNumber.text = "Session \(session.sessionNumber)"
        }else {
            cell.sessionNumber.text = "Session 0\(session.sessionNumber)"
        }
        
        cell.sessionCategory.text = session.category
        
        return cell
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sessionDetails", sender: sessions[indexPath.row])
    }
}


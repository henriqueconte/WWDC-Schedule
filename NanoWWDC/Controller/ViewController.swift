//
//  ViewController.swift
//  NanoWWDC
//
//  Created by Henrique Figueiredo Conte on 05/04/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cellSpacing: CGFloat = 30

    @IBOutlet weak var tableView: UITableView!
    
    var sessions = [
        Session(title: "WWDC 2019 Keynote", speaker: "Tim Cook", date: "Monday, Jun 3", hour: "14:00 - 16:00", hall: "HALL 2", sessionNumber: 1, category: "feature ❤", photo: "speaker-tim", sessionDetails: "Every year, a great migration is made by one of the world's most mysterious species. To reach this utopian destination, these unique mammals will instinctively embark on a nomadic journey from all corners of the world.", speakerDetails: "Apple CEO  Auburn 🏀 🏈 Duke 🏀 National Parks 🏞️ “Life's most persistent and urgent question is, 'What are you doing for others?'” - MLK"),
        
        Session(title: "Apple Design Awards", speaker: "John Geleynse", date: "Monday, Jun 3", hour: "17:00 - 19:00", hall: "HALL 1", sessionNumber: 2, category: "design 🎨", photo: "speaker-john", sessionDetails: "Join us for an unforgettable award ceremony celebrating developers and their outstanding work. The 2018 Apple Design Awards recognize state of the art iOS, macOS, watchOS, and tvOS apps that reflect excellence in design and innovation.", speakerDetails: "Director of Technology Evangelism & User Experience Evangelist. Specialties: User interface design, visual design, interaction design, human interface design consulting."),
        Session(title: "What's new in Swift", speaker: "Slava Pestov", date: "Monday, Jun 3", hour: "19:30-21:00", hall: "HALL 3", sessionNumber: 3, category: "developer 💻", photo: "speaker-slava", sessionDetails: "Hear about the latest advancements in Swift, the safe, fast, and expressive language. Find out about improvements to build times, code size, and runtime performance. Learn how to take advantage of new features in your code that eliminate boilerplate, increase safety and security, and improve your overall development productivity.", speakerDetails: "Working at Apple on the Swift programming language. Key focus areas: Fixing compiler crashers, implementing missing features and edge cases.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let session = sender as? Session {
            if let nextViewController = segue.destination as? DetailsSession {
                nextViewController.session = session
            }
        }
    }

    @IBAction func favoriteSession(_ sender: UIButton) {
        if sender.currentBackgroundImage == UIImage(named: "favorites2x"){
            let image = UIImage(named: "favorites-select2x")
            //sender.image = UIImage(named: "favorites-selected2x")
            print("a")
            sender.setBackgroundImage(image, for: .normal)
        }
        else {
            let image = UIImage(named: "favorites2x")
            
            sender.setBackgroundImage(image, for: .normal)
            print("b")
        }
        
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessionCell") as? SessionTableViewCell else {
            return UITableViewCell()
        }
        
        let session = sessions[indexPath.row]
        
        cell.sessionImageView.image = UIImage(named: session.photo)
        
        cell.sessionTitle.text = session.title
        cell.sessionSpeaker.text = "Speaker: \(session.speaker)"
        cell.sessionHour.text = session.hour
        cell.sessionHall.text = session.hall
        cell.sessionNumber.text = "Session 0\(session.sessionNumber)"
        cell.sessionCategory.text = session.category
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacing
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Monday, Jun 3"
//
//    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sessionDetails", sender: sessions[indexPath.row])
    }
}


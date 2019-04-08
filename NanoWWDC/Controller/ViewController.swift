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
        Session(title: "WWDC 2019 Keynote", speaker: "Tim Cook", hour: "14:00 - 16:00", hall: "HALL 2", sessionNumber: 1, category: "feature ❤", photo: "speaker-tim"),
        Session(title: "Apple Design Awards", speaker: "John Geleynse", hour: "17:00 - 19:00", hall: "HALL 1", sessionNumber: 2, category: "design 🎨", photo: "speaker-john"),
        Session(title: "What's new in Swift", speaker: "Slava Pestov", hour: "19:30-21:00", hall: "HALL 3", sessionNumber: 3, category: "developer 💻", photo: "speaker-slava")
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
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sessionDetails", sender: sessions[indexPath.row])
    }
}


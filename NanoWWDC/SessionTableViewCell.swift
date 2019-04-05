//
//  SessionTableViewCell.swift
//  NanoWWDC
//
//  Created by Henrique Figueiredo Conte on 05/04/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var sessionImageView: UIImageView!
    @IBOutlet weak var sessionTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}

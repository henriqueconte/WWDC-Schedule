//
//  ShadowView.swift
//  NanoWWDC
//
//  Created by Henrique Figueiredo Conte on 09/04/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import UIKit

@IBDesignable
final class ShadowView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = false
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowRadius = 10
            layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            layer.shadowOpacity = 0.25
            
        }
    }
    
}

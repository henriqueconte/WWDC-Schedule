//
//  ViewStyle.swift
//  NanoWWDC
//
//  Created by Vitor Demenighi on 05/04/19.
//  Copyright © 2019 Henrique Figueiredo Conte. All rights reserved.
//

import UIKit

@IBDesignable
final class ViewStyle: UIView {
    
    // Pra ver no storyboard
    @IBInspectable
    var cornerRadius: CGFloat = 0.0 {
        didSet{

            layer.cornerRadius = cornerRadius
            
            // Caso tenha um corner radius nao desenha quadrado
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    
    
    
}

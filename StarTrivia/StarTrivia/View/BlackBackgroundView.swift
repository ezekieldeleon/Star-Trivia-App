//
//  BlackBackgroundView.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 10/5/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}

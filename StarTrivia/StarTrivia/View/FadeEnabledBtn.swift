//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 10/28/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import UIKit

class FadeEnabledBtn: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}

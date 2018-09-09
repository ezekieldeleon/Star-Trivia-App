//
//  ViewController.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 9/9/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {

    // Outlets
    @IBOutlet weak var stackBg: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackBg.layer.cornerRadius = 10
    }
}


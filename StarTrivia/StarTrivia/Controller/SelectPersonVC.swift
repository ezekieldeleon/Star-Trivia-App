//
//  ViewController.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 9/9/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    var personApi = PersonApi()

    override func viewDidLoad() {
        super.viewDidLoad()
        personApi.getRandomPersonUrlSession()
    }
}


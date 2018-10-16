//
//  ViewController.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 9/9/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var massLbl: UILabel!
    @IBOutlet weak var hairLbl: UILabel!
    @IBOutlet weak var birthYearLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    
    
    var personApi = PersonApi()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Step 1: make networking request
        personApi.getRandomPersonUrlSession { (person) in
            if let person = person {
                print(person.name)
            }
        }
        // Step 2:
    }
}


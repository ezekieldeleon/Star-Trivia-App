//
//  StarshipsVC.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 10/30/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import UIKit

class StarshipsVC: UIViewController, PersonProtocol {
    
    // Outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var makerLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var lengthLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    @IBOutlet weak var crewLbl: UILabel!
    @IBOutlet weak var passengersLbl: UILabel!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person.name)
    }
    @IBAction func previousBtnClicked(_ sender: Any) {
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
    }
    
}

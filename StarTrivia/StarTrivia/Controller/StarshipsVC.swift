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
    let api = StarshipApi()
    var starship = [String]()
    var currentStarship = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starship = person.starshipUrls
        nextBtn.isEnabled = starship.count > 1
        previousBtn.isEnabled = false
        guard let firstStarship = starship.first else { return }
        getStarship(url: firstStarship)
    }
    
    func getStarship(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    func setupView(starship: Starship) {
        nameLbl.text = starship.name
        modelLbl.text = starship.model
        makerLbl.text = starship.manufacturer
        costLbl.text = starship.cost
        lengthLbl.text = starship.length
        speedLbl.text = starship.speed
        crewLbl.text = starship.crew
        passengersLbl.text = starship.passengers
        
    }
    
    @IBAction func previousBtnClicked(_ sender: Any) {
        currentStarship -= 1
        setButtonState()
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        currentStarship += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentStarship == starship.count - 1 ? false : true
        previousBtn.isEnabled = currentStarship == 0 ? false : true
        getStarship(url: starship[currentStarship])
    }
}

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
    @IBOutlet weak var homeworldBtn: UIButton!
    @IBOutlet weak var vehiclesBtn: UIButton!
    @IBOutlet weak var starshipsBtn: UIButton!
    @IBOutlet weak var filmsBtn: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var personApi = PersonApi()
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        let random = Int.random(in: 1 ... 87)
        spinner.startAnimating()
        personApi.getRandomPersonAlamo(id: random) { (person) in
            self.spinner.stopAnimating()
            if let person = person {
                self.setupView(person: person)
                self.person = person
            }
        }
    }
    
    func setupView(person: Person) {
        nameLbl.text = person.name
        heightLbl.text = person.height
        massLbl.text = person.mass
        hairLbl.text = person.hair
        birthYearLbl.text = person.birthYear
        genderLbl.text = person.gender
        
        homeworldBtn.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesBtn.isEnabled = !person.vehicleUrls.isEmpty
        starshipsBtn.isEnabled = !person.starshipUrls.isEmpty
        filmsBtn.isEnabled = !person.filmUrls.isEmpty
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
    }
}

protocol PersonProtocol {
    var person: Person! {get set}
}

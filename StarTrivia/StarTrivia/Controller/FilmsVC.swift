//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 10/30/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController, PersonProtocol {
    
    //Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var crawLbl: UITextView!
    

    var person: Person!
    let api = FilmsApi()
    var films = [String]()
    var currentFilm = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
    }
    
    func getFilm(url: String){
        api.getFilm(url: url) { (film) in
            if let film = film {
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film : Film) {
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    @IBAction func previousBtnClicked(_ sender: Any) {
        currentFilm -= 1
        setButtonState()
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        currentFilm += 1
        setButtonState()
    }
    
    func setButtonState() {
        nextBtn.isEnabled = currentFilm == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilm == 0 ? false : true
        getFilm(url: films[currentFilm])
    }
}

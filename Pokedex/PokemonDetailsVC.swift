//
//  PokemonDetailsVC.swift
//  Pokedex
//
//  Created by Ismail Hossain on 2017-05-08.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit

class PokemonDetailsVC: UIViewController {
    
    
    @IBOutlet weak var pokemonNameLbl: UILabel!
    @IBOutlet weak var segmentedView: UISegmentedControl!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var nextEvoLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLbl.text = pokemon.name
        self.pokedexIDLbl.text = "\(pokemon.pokedexID!)"
        
        let img = UIImage(named: "\(pokemon.pokedexID!)")
        mainImage.image = img
        currentEvoImg.image = img
        
        pokemon.downloadInfo {
            
            self.updateVC()
            
        }
    }
    
    func updateVC() {
        
        self.attackLbl.text = pokemon.attack
        self.defenseLbl.text = pokemon.defense
        self.heightLbl.text = pokemon.height
        self.weightLbl.text = pokemon.weight
        self.typeLbl.text = pokemon.type
        self.descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionID == "" {
            self.nextEvoLbl.text = "No Evolutions"
            self.nextEvoImg.isHidden = true
        }
        else {
            
            self.nextEvoImg.isHidden = false
            self.nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionID)")
            self.nextEvoLbl.text = "Next Evolution: \(pokemon.nextEvolutionName) Lvl \(pokemon.nextEvolutionLvl)"
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}

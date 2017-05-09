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

    }

}

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
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonNameLbl.text = pokemon.name

    }

}

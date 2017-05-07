//
//  PokeCell.swift
//  Pokedex
//
//  Created by Ismail Hossain on 2017-05-06.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        self.pokeImage.image = UIImage(named: "\(self.pokemon.pokedexID)")
        self.pokeName.text = self.pokemon.name
    }

}

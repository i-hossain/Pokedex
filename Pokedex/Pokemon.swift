//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ismail Hossain on 2017-05-05.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    
    var name: String {
        return _name
    }
    
    var pokemonID: Int {
        return _pokedexID
    }
    
    init(name: String, pokemonID: Int) {
        self._name = name
        self._pokedexID = pokemonID
    }
    
}

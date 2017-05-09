//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ismail Hossain on 2017-05-05.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _pokemonName: String!
    private var _pokedexID: Int!
    private var description: String!
    private var pokemonType: String!
    private var attack: String!
    private var defense: String!
    private var height: String!
    private var weight: String!
    private var nextEvolution: String!
    
    var name: String {
        return _pokemonName
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._pokemonName = name.capitalized
        self._pokedexID = pokedexID
    }
    
}

//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ismail Hossain on 2017-05-05.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import Foundation

class Pokemon {
    
    fileprivate var _name: String!
    fileprivate var _pokedexID: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name.capitalized
        self._pokedexID = pokedexID
    }
    
}

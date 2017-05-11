//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ismail Hossain on 2017-05-05.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _attack: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _nextEvolution: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        return _type
    }
    
    var attack: String {
        return _attack
    }
    
    var defense: String {
        return _defense
    }
    
    var height: String {
        return _height
    }
    
    var weight: String {
        return _weight
    }
    
    var nextEvolution: String {
        return _nextEvolution
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name.capitalized
        self._pokedexID = pokedexID
        self._pokemonURL = "\(BASE_URL)\(POKEMON_URL)\(self._pokedexID!)/"
    }
    
    func downloadInfo(completed: @escaping ()->()) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            completed()
        }
    }
    
}

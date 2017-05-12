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
    
    internal private(set) var name: String!
    internal private(set) var pokedexID: Int!
    internal private(set) var description: String = ""
    internal private(set) var type: String = ""
    internal private(set) var attack: String = ""
    internal private(set) var defense: String = ""
    internal private(set) var height: String = ""
    internal private(set) var weight: String = ""
    internal private(set) var nextEvolutionName: String = ""
    internal private(set) var nextEvolutionLvl: String = ""
    internal private(set) var nextEvolutionID: String = ""
    internal private(set) var pokemonURL: String = ""
    
    
    init(name: String, pokedexID: Int) {
        self.name = name.capitalized
        self.pokedexID = pokedexID
        self.pokemonURL = "\(BASE_URL)\(POKEMON_URL)\(self.pokedexID!)/"
    }
    
    func downloadInfo(completed: @escaping ()->()) {
        Alamofire.request(pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let attack = dict["attack"] as? Int {
                    self.attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self.defense = "\(defense)"
                }
                
                if let height = dict["height"] as? String {
                    self.height = height
                }
                
                if let weight = dict["weight"] as? String {
                    self.weight = weight
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    if let name = types[0]["name"] {
                        self.type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self.type += "/\(name.capitalized)"
                            }
                            
                        }
                    }
                }
                
                if let descriptions = dict["descriptions"] as? [Dictionary<String, AnyObject>], descriptions.count > 0 {
                    
                    if let resource_uri = descriptions[0]["resource_uri"] as? String {
                        
                        let descriptionURL = "\(BASE_URL)\(resource_uri)"
                        Alamofire.request(descriptionURL).responseJSON(completionHandler: { (response) in
                            
                            if let descriptionResult = response.result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descriptionResult["description"] as? String {
                                    
                                    let updatedDescription = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                                    self.description = updatedDescription
                                }
                            }
                            completed()
                        })
                    }
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
                    
                    if let nextEvolution = evolutions[0]["to"] as? String {
                        
                        if nextEvolution.range(of: "mega") == nil {
                            self.nextEvolutionName = nextEvolution
                            
                            if let nextEvolutionURI = evolutions[0]["resource_uri"] as? String {
                                let newString = nextEvolutionURI.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvolutionID = newString.replacingOccurrences(of: "/", with: "")
                                
                                self.nextEvolutionID = nextEvolutionID
                            }
                            
                            if let nextLevelExists = evolutions[0]["level"] {
                                
                                if let nextLevel = nextLevelExists as? Int {
                                    self.nextEvolutionLvl = "\(nextLevel)"
                                }
                                
                            }
                        }
                    }
                }
            }
            
            completed()
        }
    }
    
}

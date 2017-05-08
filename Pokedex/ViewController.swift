//
//  ViewController.swift
//  Pokedex
//
//  Created by Ismail Hossain on 2017-05-05.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    var searchMode: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        self.parseCSV()
        self.initializeMusic()
        
    }
    
    func initializeMusic() {
        
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        do {
            
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        }
        catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    func parseCSV() {
        
        let csvFilePath = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        do {
            
            let csv = try CSV(contentsOfURL: csvFilePath!)
            let rows = csv.rows
            
            for row in rows {
                
                let pokemonName = row["identifier"]
                let pokemonID = Int(row["id"]!)
                let pokemonObj = Pokemon(name: pokemonName!, pokedexID: pokemonID!)
                pokemon.append(pokemonObj)
            }
        } catch let error as NSError {
            print(error)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let pokemonObj: Pokemon?
            
            if searchMode {
                pokemonObj = filteredPokemon[indexPath.row]
            }
            else {
                pokemonObj = pokemon[indexPath.row]
            }
            
            cell.configureCell(pokemonObj!)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchMode {
            return filteredPokemon.count
        }
        
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            searchMode = false
            view.endEditing(true)
        }
        else {
            
            searchMode = true
            let searchedPokemon = searchBar.text!.capitalized
            filteredPokemon = pokemon.filter({$0.name.range(of: searchedPokemon) != nil})
        }
        collection.reloadData()

    }
    
    @IBAction func musicBtnPress(_ sender: UIButton) {
        if musicPlayer.isPlaying {
            
            musicPlayer.pause()
            sender.alpha = 0.2
        }
        else {
            
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }

}


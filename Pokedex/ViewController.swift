//
//  ViewController.swift
//  Pokedex
//
//  Created by Ismail Hossain on 2017-05-05.
//  Copyright © 2017 Ismail Hossain. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    var pokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
        
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
                
                let pokeName = row["identifier"]
                let pokeID = Int(row["id"]!)
                let pokemonObj = Pokemon(name: pokeName!, pokedexID: pokeID!)
                pokemon.append(pokemonObj)
            }
        } catch let error as NSError {
            print(error)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collection.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let pokemonObj = pokemon[indexPath.row]
            cell.configureCell(pokemonObj)
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
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
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


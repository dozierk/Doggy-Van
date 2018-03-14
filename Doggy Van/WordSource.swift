//
//  WordSource.swift
//  Doggy Van
//
//  Created by Dwayne Langley on 6/7/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import Foundation
import Alamofire

/** A utility methods to provide the words for the game.*/
extension Word {
    
    static func source(with amount: Int, _ completion: @escaping ([Word]) -> ()) {
        var allWords = [Word]() {
            willSet {
                print("NEW VALUE \(newValue)")
                
            }
            didSet {
                guard allWords.count == amount else {
                    print("\nNOT YET!!!\n")
                    return
                }
                
                return completion(allWords.shuffle())
            }
        }
        
        for type in Word.Class.all {
            let equalAmount = amount/Word.Class.all.count
            retrieve(amount: equalAmount, of: type) { (words) in
                allWords += words
            }
        }
    }
    
    /// Dictionary API for a certain amount and type of words from wordnik with Alamofire.
    static func retrieve(amount: Int, of type: Word.Class, _ completion: @escaping ([Word]) -> ()) {
        
        var newList = [Word]() {
            willSet {
                return completion(newValue)
            }
        }
        
        let appKey = "adeea3a5440b08487f0090f7aa90074dccc3537883304ad77"
        let urlString = "http://api.wordnik.com:80/v4/words.json/randomWords?hasDictionaryDef=false&includePartOfSpeech=\(type)&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=9&minLength=5&maxLength=-1&limit=\(amount)&api_key=\(appKey)"
        
        Alamofire.request(urlString).responseJSON { (response) in
            //            print("\nREQUEST: \n\(String(describing: response.request))")
            //            print("\nRESPONSE: \n\(String(describing: response.response))")
            //            print("\nERROR: \n\(String(describing: response.error))")
            
            guard let wordDictionaries = response.result.value as? [[String: Any]] else {
                print("The data structure on the server has incompatible with wordDictionaries.")
                return
            }
            
            batch(from: wordDictionaries, of: type, { (results) in
                newList = results
            })
        }
    }
    
    /// Converts an Array of Dictionaries with results from Wordnik into an Array of Words.
    static func batch(from dictionaries: [[String : Any]], of type: Word.Class, _ completion: @escaping ([Word]) -> ()) {
        var results = [Word]()
        for dictionary in dictionaries {
            
            let value = dictionary["word"] as! String
            print("convertingDictinary:\(value)")
            
            let newWord = Word(value, as: type)
            results.append(newWord)
            print("Initialized a \(type): \(newWord)")
        }
        
        return completion(results)
    }
}

extension Collection {
    
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}


//
extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex {
            let j = (Int(arc4random_uniform(UInt32(endIndex))) + i) % endIndex
            guard i != j else { continue }
            self.swapAt(i, j)
        }
    }
}

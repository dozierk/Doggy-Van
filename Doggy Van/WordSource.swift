//
//  WordSource.swift
//  Doggy Van
//
//  Created by Dwayne Langley on 6/7/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import Foundation
import Alamofire


/** A utility class made to provide the words for the game. This class will likely be where Dictionary APIs get implemented to replace this temporary manual encapsulation of words.*/
class Source {

class func grab(amount: Int, _ completion: @escaping ([Word]) -> ()) {
    let types = ["verb", "adjective", "noun"]
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
    
    for type in types {
        retrieve(amount: 10, of: type) { (words) in
            allWords += words
        }
    }
}

/// Dictionary API for a certain amount and type of words from wordnik with Alamofire.
class func retrieve(amount: Int, of type: String, _ completion: @escaping ([Word]) -> ()) {
    
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
        
        convert(wordDictionaries, of: type, { (results) in
            newList = results
        })
    }
}

/// Converts an Array of Dictionaries with results from Wordnik into an Array of Words.
class func convert(_ wordDictionaries: [[String : Any]], of type: String, _ completion: @escaping ([Word]) -> ()) {
    var results = [Word]()
    for dictionary in wordDictionaries {
        
        let value = dictionary["word"] as! String
        print("convertingDictinary:\(value)")
        
        switch type {
        case "verb":
            let newVerb = Word(value, as: .verb) //Verb(string: value)
            results.append(newVerb)
            print("Initialized a Verb:\(newVerb)")
        case "noun":
            let newNoun = Word(value, as: .noun) //Noun(string: value)
            results.append(newNoun)
            print("Initialized a Noun:\(newNoun)")
        case "adjective":
            let newAdjective = Word(value, as: .adjective) //Adjective(string: value)
            results.append(newAdjective)
            print("Initialized an Adjective:\(newAdjective)")
        default:
            print("DoggyVan does not currently support \(type)s")
            break
        }
    }
    
    return completion(results)
}
}



//Alamofire.request("URL GOES HERE \(language)/\(filters)
//    ").responseJSON { response in print(response.request) // original URL request print(response.response) // HTTP URL response print(response.data) // server data print(response.result) // result of response serialization if let JSON = response.result.value { print("//JSON: \(JSON)") } }
//
//
//    Alamofire.request("https://httpbin.org/get").responseJSON { response in
//    print(response.request)  // original URL request
//    print(response.response) // HTTP URL response
//    print(response.data)     // server data
//    print(response.result)   // result of response serialization
//
//    if let JSON = response.result.value {
//    print("JSON: \(JSON)")
//    }
//}

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


//        let verbs : [Word] = [Verb(string: "DANCE"), Verb(string: "SLIDE"), Verb(string: "BOUNCE"), Verb(string: "SCREAM"), Verb(string: "EAT"), Verb(string: "JUMP"), Verb(string: "SLEEP"), Verb(string: "PLAY"), Verb(string: "CARRY"), Verb(string: "SING")]
//      let adjs : [Word] = [Adjective(string: "SMALL"), Adjective(string: "BIG"), Adjective(string: "LOUD"), Adjective(string: "QUIET"), Adjective(string: "EMPTY"), Adjective(string: "ANGRY"), Adjective(string: "LAST"), Adjective(string: "FAST"), Adjective(string: "LONG"), Adjective(string: "WET")]
//    let nouns : [Word] = [Noun(string: "BALLOON"), Noun(string: "DRESS"), Noun(string: "BOOK"), Noun(string: "AIRPLANE"), Noun(string: "BALL"), Noun(string: "CAT"), Noun(string: "DOG"), Noun(string: "APPLE"), Noun(string: "GIRL"), Noun(string: "BOY")]

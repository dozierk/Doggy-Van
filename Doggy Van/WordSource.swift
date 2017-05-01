//
//  WordSource.swift
//  Doggy Van
//
//  Created by Dwayne Langley on 6/7/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import Foundation
//import Alamofire


/** A utility class made to provide the words for the game.  This class will likely be where Dictionary APIs get implemented to replace this temporary manual encapsulation of words.*/

class Source {
    class func getWords(amount: Int) -> [Word] {
        
        let verbs : [Word] = [Verb(string: "DANCE"), Verb(string: "SLIDE"), Verb(string: "BOUNCE"), Verb(string: "SCREAM"), Verb(string: "EAT"), Verb(string: "JUMP"), Verb(string: "SLEEP"), Verb(string: "PLAY"), Verb(string: "CARRY"), Verb(string: "SING")]
        let adjs : [Word] = [Adjective(string: "SMALL"), Adjective(string: "BIG"), Adjective(string: "LOUD"), Adjective(string: "QUIET"), Adjective(string: "EMPTY"), Adjective(string: "ANGRY"), Adjective(string: "LAST"), Adjective(string: "FAST"), Adjective(string: "LONG"), Adjective(string: "WET")]
        let nouns : [Word] = [Noun(string: "BALLOON"), Noun(string: "DRESS"), Noun(string: "BOOK"), Noun(string: "AIRPLANE"), Noun(string: "BALL"), Noun(string: "CAT"), Noun(string: "DOG"), Noun(string: "APPLE"), Noun(string: "GIRL"), Noun(string: "BOY")]
        
        return (verbs + adjs + nouns).shuffle()
        
//        Alamofire.request("https:od-api.oxforddictionaries.com/api/v1")
    }
}
// Dictionary API used for extending word source and replace the initial encapsulation of words. 

func wordOxford() {
    // TODO: replace with your own app id and app key
//    let appId = "69682fbe"
//    let appKey = "7f8c6d93fef65509c06235eba8997239"
//    let language = "en"
//    let filters = "registers=Rare;domains=Art"
    let appId = "Doggy Van"
    let appKey = "7f8c6d93fef65509c06235eba8997239"
    let language = "en"
    let filters = "registers=Rare;domains=Art"
    let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v1/wordlist/\(language)/\(filters)")!
    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue(appId, forHTTPHeaderField: "app_id")
    request.addValue(appKey, forHTTPHeaderField: "app_key")
    
    let session = URLSession.shared
    _ = session.dataTask(with: request, completionHandler: { data, response, error in
        if let response = response,
            let data = data,
            let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print(response)
            print(jsonData)
        } else {
            print(error)
            print(String.init(data: data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue)))
        }
        
    }).resume()
}


//Alamofire.request("URL GOES HERE \(language)/\(filters)
//    ").responseJSON { response in print(response.request) // original URL request print(response.response) // HTTP URL response print(response.data) // server data print(response.result) // result of response serialization if let JSON = response.result.value { print("//JSON: \(JSON)") } }


//    Alamofire.request("https://httpbin.org/get").responseJSON { response in
//    print(response.request)  // original URL request
//    print(response.response) // HTTP URL response
//    print(response.data)     // server data
//    print(response.result)   // result of response serialization
    
//    if let JSON = response.result.value {
//    print("JSON: \(JSON)")
//    }
//}

extension Collection {
    
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
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
            swap(&self[i], &self[j])
        }
    }
}

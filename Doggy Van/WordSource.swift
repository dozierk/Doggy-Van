//
//  WordSource.swift
//  Doggy Van
//
//  Created by Dwayne Langley on 6/7/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import Foundation

/** A utility class made to provide the words for the game.  This class will likely be where Dictionary APIs get implemented to replace this temporary manual encapsulation of words.*/
class Source {
    class func getWords(amount: Int) -> [Word] {
        
        let verbs : [Word] = [Verb(string: "Dance"), Verb(string: "Slide"), Verb(string: "Bounce"), Verb(string: "Scream"), Verb(string: "Eat"), Verb(string: "Jump"), Verb(string: "Sleep"), Verb(string: "Play"), Verb(string: "Carry"), Verb(string: "Sing")]
        let adjs : [Word] = [Adjective(string: "Small"), Adjective(string: "Big"), Adjective(string: "Loud"), Adjective(string: "Quiet"), Adjective(string: "Empty"), Adjective(string: "Angry"), Adjective(string: "Last"), Adjective(string: "Fast"), Adjective(string: "Long"), Adjective(string: "Wet")]
        let nouns : [Word] = [Noun(string: "Balloon"), Noun(string: "Dress"), Noun(string: "Book"), Noun(string: "Airplane"), Noun(string: "Ball"), Noun(string: "Cat"), Noun(string: "Dog"), Noun(string: "Apple"), Noun(string: "Girl"), Noun(string: "Boy")]
        
        return (verbs + adjs + nouns).shuffle()
    }
}

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
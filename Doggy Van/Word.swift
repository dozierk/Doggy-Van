//
//  Word.swift
//  Doggy Van
//
//  Created by Kayla Dozier on 6/6/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import Foundation

/** The Base Model class that contains 2 properties, a string and a type(verb, adjective, or noun) The "type" property may end up being redundant because we can compare the data types to find out what kind of word it is. */
class Word {
    var string : String
    var type : String?
    var isVerb : Bool
    var isAdjective: Bool
    var isNoun: Bool
    
    init(string: String) {
        self.string = string
        isVerb = false
        isAdjective = false
        isNoun = false
        
    }
}

/** A class for nouns. */
class Noun: Word {
    override init(string: String) {
        super.init(string: string)
        type = "noun"
        isNoun = true
    }
}

/** A class for Verbs. */
class Verb: Word {
    override init(string: String) {
        super.init(string: string)
        type = "verb"
        isVerb = true
    }
}

/** A class for Adjectives. */
class Adjective: Word {
    override init(string: String) {
        super.init(string: string)
        type = "adjective"
        isAdjective = true
    }
}

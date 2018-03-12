//
//  Word.swift
//  Doggy Van
//
//  Created by Kayla Dozier on 6/6/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import Foundation

struct Word: Grammatical {
    private var val : String?
    var partOfSpeech: Class?
    
    init(_ value: String?, as partOfSpeech: Word.Class) {
        val = value
        self.partOfSpeech = partOfSpeech
    }
    
    enum Class {
        case noun, verb, adjective
        static var all: [Class] { return [.noun, .verb, .adjective]}
    }
}

extension Word: CustomStringConvertible {
    var description: String {
        return val ?? "nil"
    }
}

extension Word: ExpressibleByStringLiteral {
    typealias StringLiteralType = String
    
    init(stringLiteral value: Word.StringLiteralType) {
        val = String(describing: value)
    }
}

extension Word: ExpressibleByNilLiteral {
    init(nilLiteral: ()) {
        val = nil
    }
}

protocol Grammatical {
    var partOfSpeech: Word.Class? { get set }
}

extension Grammatical {
    var isNoun: Bool { return partOfSpeech == .noun }
    var isVerb: Bool { return partOfSpeech == .verb }
    var isAdjective: Bool { return partOfSpeech == .adjective }
}

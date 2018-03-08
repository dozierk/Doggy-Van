//
//  Word.swift
//  Doggy Van
//
//  Created by Kayla Dozier on 6/6/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import Foundation

protocol Grammatical {
    var tense: Word.Class? { get set }
}

extension Grammatical {
    var isNoun: Bool { return tense == .noun }
    var isVerb: Bool { return tense == .verb }
    var isAdjective: Bool { return tense == .adjective }
}


struct Word: Grammatical {
    private var val : String?
    var tense: Word.Class?
    
    enum Class {
        case noun, verb, adjective
    }
    
    init(_ value: String?, as tense: Word.Class) {
        val = value
        self.tense = tense
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

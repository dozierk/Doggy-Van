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
    
    enum Class: CaseIterable {
        case noun, verb, adjective
    }
    
    enum Error: String, LocalizedError {
        case iosSDK = "iOS SDK API failed."
    }
}

extension Word: CustomStringConvertible {
    var description: String {
        return "\(String(describing: partOfSpeech))(\(val ?? "nil"))"
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

extension Word: RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: String) {
        val = rawValue
    }
    
    var rawValue: String { val ?? "nil" }
}

extension Word: Decodable {
    enum Key: String, CodingKey { case val = "word", partOfSpeech }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        val = try container.decode(String.self, forKey: .val)
        partOfSpeech = Self.currentlyDownloading
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

extension Word {
    static var currentlyDownloading: Class!
    
    /// Retrieves a new list of words from the backend.
    /// - Parameter amount: Default value is 30.
    static func newList(of amount: Int = 30) async throws -> [Word] {
        var words = [Word]()
        let types = Word.Class.allCases
        for type in types {
            currentlyDownloading = type
            let appKey = "adeea3a5440b08487f0090f7aa90074dccc3537883304ad77"
            let urlString = "http://api.wordnik.com:80/v4/words.json/randomWords?hasDictionaryDef=false&includePartOfSpeech=\(type)&minCorpusCount=0&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=9&minLength=5&maxLength=-1&limit=\(amount/types.count)&api_key=\(appKey)"
            guard let url = URL(string: urlString) else { throw Error.iosSDK }
            let (data, _) = try await URLSession.shared.data(from: url)
            words += try JSONDecoder().decode([Self].self, from: data)
        }
        words.shuffle()
        return words
    }
}

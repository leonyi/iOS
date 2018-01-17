//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Tutorial: Codable {
    let title: String
    let author: String
    let editor: String
    let type: String
    let publishDate: Date
    
    init(title: String, author: String, editor: String, type: String, publishDate: Date){
        self.title = title
        self.author = author
        self.editor = editor
        self.type = type
        self.publishDate = publishDate
    }
}

let tutorial = Tutorial(title: "What's New in Swift4?", author: "Cosmin Pupaza", editor: "John Doe", type: "Swift", publishDate: Date() )

// Encoding the tutorial
let encoder = JSONEncoder()
let data = try encoder.encode(tutorial)
let string = String(data:data, encoding: .utf8)

// Decoding the tutorial
let decoder = JSONDecoder()
let article = try decoder.decode(Tutorial.self, from: data)
let info = "\(article.title), \(article.author) \(article.editor) \(article.type)"

// Smarter Key Paths
class Author {
    let name: String
    let tutorial: Tutorial
    
    init(name: String, tutorial, Tutorial){
        self.name = name
        self.tutorial = tutorial
    }
}

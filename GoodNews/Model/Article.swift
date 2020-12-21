//
//  Article.swift
//  GoodNews
//
//  Created by Steve JobsOne on 12/21/20.
//

import Foundation

struct ArticalList: Decodable {
    let articles:[Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}

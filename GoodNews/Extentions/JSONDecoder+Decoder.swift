//
//  Decoder.swift
//  GoodNews
//
//  Created by Steve JobsOne on 12/21/20.
//

import Foundation


enum DecodeResult<data, error> {
    case success(data)
    case failure(error)
}

typealias DecodeHandler = (DecodeResult<Decodable,Error>) -> Void

extension JSONDecoder{
    static func decodeData<Model: Decodable>(model: Model.Type,_ data:Data,completion: @escaping(DecodeHandler)){
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(Model.self, from: data)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
}

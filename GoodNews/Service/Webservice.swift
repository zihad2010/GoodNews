//
//  Webservice.swift
//  GoodNews
//
//  Created by Steve JobsOne on 12/21/20.
//

import Foundation

class Websevice {
    
    func getArticles(url:URL, completion:@escaping([Article]?)->()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                
                JSONDecoder.decodeData(model: ArticalList.self, data) { [weak self](result) in
                  
                    switch result{
                    case .success(let data ):
                        print(data)
                        completion(data as? [Article])
                        break
                    case .failure(let mess):
                        print("Parse data error:",mess.localizedDescription)
                        break
                    }
                }
                
            }
        }.resume()
    }
}

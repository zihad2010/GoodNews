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
                
                JSONDecoder.decodeData(model: ArticalList.self, data) { (result) in
                    
                    switch result{
                    case .success(let data ):
                        let data:ArticalList = data as! ArticalList
                        completion(data.articles)
                        break
                    case .failure(let error):
                        print("Parse data error:",error.localizedDescription)
                        break
                    }
                }
            }
        }.resume()
    }
    
}

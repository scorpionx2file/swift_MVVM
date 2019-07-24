//
//  WebServices.swift
//  Headlines
//
//  Created by Mac Mini on 7/23/19.
//  Copyright © 2019 Syntax. All rights reserved.
//

import Foundation


class WebServices {
    
    
    func getArticles(url : URL , completion : @escaping ([Article]?) ->()) {
        
        URLSession.shared.dataTask(with: url){ data , response , erorr in
            
            if let erorr = erorr {
                print("emEr : \(erorr)")
                completion(nil)
            }else if let data = data {
                
//                do {

                    let articleslist = try? JSONDecoder().decode(ArticlesList.self ,from: data)
                    
                    if let articleslist = articleslist{

                        completion(articleslist.articles)

                    }
                    
                    print("emData : \(String(describing: data))")
                    
                    
//                } catch {
//                    print("error: ", error.localizedDescription)
//                }
                
                
            }
            
        }.resume()
        
    }
}

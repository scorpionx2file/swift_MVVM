//
//  ArticelViewModel.swift
//  Headlines
//
//  Created by Mac Mini on 7/23/19.
//  Copyright © 2019 Syntax. All rights reserved.
//

import Foundation

struct ArticelViewModel {
    
    private let article : Article
}

extension ArticelViewModel {
    
    init(_ article :Article) {
        
        self.article = article
    }
}

extension ArticelViewModel {
    
    var title : String {
        return self.article.title ?? "..."
    }
    
    var description : String {
        return self.article.description ?? "..."
    }
    
    
}

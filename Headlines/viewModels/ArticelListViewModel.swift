//
//  ArticelListViewModel.swift
//  Headlines
//
//  Created by Mac Mini on 7/23/19.
//  Copyright © 2019 Syntax. All rights reserved.
//

import Foundation

struct ArticelListViewModel {
    let articles : [Article]
}

extension ArticelListViewModel {
    
    var numberOfSection: Int {
        
        return 1
    }
    
    func nubrerOfRowsInsection(_ section : Int) -> Int {
        
        return self.articles.count
    }
    
    func artlicelAtIndex (_ index: Int) -> ArticelViewModel {
        let article  = self.articles[index]
        return ArticelViewModel(article)
    }

    
}

//
//  HLMainVC.swift
//  Headlines
//
//  Created by Mac Mini on 7/23/19.
//  Copyright © 2019 Syntax. All rights reserved.
//

import Foundation
import UIKit

class HLMainVC : UITableViewController  {
    
    private var articlelistVM : ArticelListViewModel!
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        setup()
        
    }
    
    func setup ()  {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=70b976cbb68945e982e0dd5f6e907579")!
        WebServices().getArticles(url: url){ articles in
            
            if let articles = articles {
                self.articlelistVM = ArticelListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articlelistVM == nil ? 0 : self.articlelistVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.articlelistVM.nubrerOfRowsInsection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableCell", for :indexPath) as? ArticleTVCell else{
            
            fatalError("Cell Not Found")
        }
       let articleVm =  self.articlelistVM.artlicelAtIndex(indexPath.row)
        cell.titleLable.text =  articleVm.title
        cell.descriptionLable.text = articleVm.description
        
        return cell
    }
}

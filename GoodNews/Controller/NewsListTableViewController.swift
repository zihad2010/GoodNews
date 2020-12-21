//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Steve JobsOne on 12/21/20.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM = ArticleListViewModel(articles: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        Websevice().getArticles(url: URL.url!) { (articles) in
            print(articles as Any)
            if let articles = articles{
                self.articleListVM = ArticleListViewModel(articles: articles)
              
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension NewsListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not Found")
        }
        
        cell.cellViewModel = articleListVM.articleAtIndex(indexPath.row)
        return cell
    }
}

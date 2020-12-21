//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Steve JobsOne on 12/22/20.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections:Int {
        return 1
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}

struct ArticleViewModel {
    private let article: Article
    
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel{
    
    var title: String {
        return article.title
    }
    var description: String {
        return article.description
    }
}

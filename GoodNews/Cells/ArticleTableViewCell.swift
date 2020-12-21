//
//  ArticleTableViewCell.swift
//  GoodNews
//
//  Created by Steve JobsOne on 12/22/20.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titaleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var cellViewModel: ArticleViewModel?{
        didSet{
            self.titaleLabel.text = cellViewModel?.title 
            self.descriptionLabel.text = cellViewModel?.description
        }
    }
    
}

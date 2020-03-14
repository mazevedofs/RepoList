//
//  ListTableViewCell.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 14/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var repoTitleLabel: UILabel!
    @IBOutlet weak var RepoDescriptionLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var forkImageView: UIImageView!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepare(with repo: Repo) {
        ownerNameLabel.text = repo.owner?.login.valid ?? ""
        repoTitleLabel.text = repo.name.valid
            RepoDescriptionLabel.text = repo.description.valid
        starImageView.image = UIImage(named: "star")
        forkImageView.image = UIImage(named: "fork")
        starLabel.text = "\(repo.stars.valid)"
        forkLabel.text = "\(repo.forks.valid)"
        ownerImageView.source(from: repo.owner?.avatar.valid ?? "" )
        
    }
    
}

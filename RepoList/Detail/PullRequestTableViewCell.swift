//
//  PullRequestTableViewCell.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 15/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var creatorPicImageView: UIImageView!
    @IBOutlet weak var creatorNameLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var creationDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
    func prepare(with pull: PullRequest) {
        titleLabel.text = pull.title.valid
        bodyLabel.text = pull.body.valid
        creatorPicImageView.source(from: pull.user?.avatar ?? "")
        creatorNameLabel.text = pull.user?.login ?? ""
        createdAtLabel.text = "Created at:"
        creationDateLabel.text = Utils.getFormattedDateFrom(date: pull.creationDate.valid)
        
        creatorPicImageView.layer.cornerRadius = creatorPicImageView.frame.height / 2
        creatorPicImageView.clipsToBounds = true
    }
    
}

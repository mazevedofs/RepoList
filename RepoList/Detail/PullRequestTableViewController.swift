//
//  PullRequestTableViewCTableViewController.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 14/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import UIKit

enum RepoState: String {
    case open = "open"
    case closed = "closed"
    case all = "all"
}

final class PullRequestTableViewController: UITableViewController {
    
    var repo: Repo?
    var pull: [PullRequest] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = repo?.name
        loadData()
        prepareTableView()

    }
    
    private func loadData() {
        RepoAPI.loadPullRequestsByRepo(user: repo?.owner?.login ?? "", repo: repo?.name ?? "", state: .open, onComplete: { (response) in
            self.pull = response
            print(self.pull)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
    
    private func prepareTableView() {
        let pullTableViewCell = UINib(nibName: String(describing: PullRequestTableViewCell.self), bundle: nil)
        tableView.register(pullTableViewCell, forCellReuseIdentifier: "pull")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pull.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pull", for: indexPath) as! PullRequestTableViewCell
        let pullItem = pull[indexPath.row]
        cell.prepare(with: pullItem)
        print(pullItem)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

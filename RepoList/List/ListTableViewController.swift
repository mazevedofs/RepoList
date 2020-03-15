//
//  ListTableViewController.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 13/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import UIKit

enum SortOrder: String {
    case star = "stars"
    case fork = "forks"
}

final class ListTableViewController: UITableViewController {
    
    var repo: [Repo] = []
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        self.title = "Repo Java"
        
        loadData()
    }
    
    func loadData()  {
        RepoAPI.loadRepoList(language: "Java", sort: "stars", page: currentPage, onComplete: { (repoResponse) in
            self.repo = repoResponse.repo
//            print(self.repo)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! ListTableViewCell
        let repoItem = repo[indexPath.row]
        cell.prepare(with: repoItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "PullRequestTableViewController", bundle: nil)
        guard let pullRequestVC = sb.instantiateInitialViewController() as? PullRequestTableViewController else { return }
        pullRequestVC.repo = repo[indexPath.row]
        navigationController?.pushViewController(pullRequestVC, animated: true)
    }

}

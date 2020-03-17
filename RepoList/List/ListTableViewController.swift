//
//  ListTableViewController.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 13/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import UIKit

final class ListTableViewController: UITableViewController {
    
    var repo: [Repo] = []
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        self.title = "JavaPop"
        
        loadData()
        currentPage = 1
    }
    
    // MARK: - Methods
    
    func loadData()  {
        RepoAPI.loadRepoList(language: "Java", sort: "stars", page: currentPage, onComplete: { (repoResponse) in
            self.repo = repoResponse.repo
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            let alert = UIAlertController(title: "Oh oh, something wrong happened :(", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = repo.count - 1
        if indexPath.row == lastElement {
            print("LOAD MORE")
            currentPage = +1
            
//            infiniteScroll(page: currentPage)
        }
    }
    
    func infiniteScroll(page: Int){
        RepoAPI.loadMoreRepoList(language: "Java", sort: "stars", page: page, onComplete: { (response) in
            self.repo = response.repo

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            let alert = UIAlertController(title: "Oh oh, something wrong happened :(", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}

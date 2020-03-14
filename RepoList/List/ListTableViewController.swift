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
    var currentPage = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        self.title = ""
        
        loadData(language: "java", sort: .star, page: currentPage)
        prepareTableView()
    }
    
    private func prepareTableView() {
        let listTableViewCell = UINib(nibName: String(describing: ListTableViewCell.self), bundle: nil)
        tableView.register(listTableViewCell, forCellReuseIdentifier: "list")

    }

    // MARK: - Table view data source

    func loadData(language: String, sort: SortOrder, page: Int)  {
        RepoAPI.loadRepoList(language: "Java", sort: "stars", page: 1, onComplete: { (repoResponse) in
            self.repo = repoResponse.repo
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
//
//
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

}

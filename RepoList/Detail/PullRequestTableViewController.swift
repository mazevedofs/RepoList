//
//  PullRequestTableViewCTableViewController.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 14/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import UIKit

final class PullRequestTableViewController: UITableViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var repo: Repo?
    var pull: [PullRequest] = []
    var count = 0
    var emptyView = UIView()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        emptyView.isHidden = true
        self.title = repo?.name
        loadData(state: .open)
        prepareTableView()
        setupSegmentedControl()
        tableView.tableFooterView = UIView()
    }
    // MARK: - Methods
    
    private func setupSegmentedControl() {
        segmentedControl.setTitle("Open", forSegmentAt: 0)
        segmentedControl.setTitle("Closed", forSegmentAt: 1)
    }
    
    @IBAction func selectSegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.loadData(state: .open)
        } else if sender.selectedSegmentIndex == 1 {
            self.loadData(state: .closed)
        }
    }
    
    func setupEmptyView() {
        let screen =  UIScreen.main.bounds
        let screenWidth = screen.width
        let screenHeight = screen.height
        
        emptyView.frame = CGRect(x: 0, y: 60, width: screenWidth, height: screenHeight)
        
        label = UILabel(frame: CGRect(x: screenWidth / 6, y: 50, width: screenWidth - 40, height: 100))
        let text = "No Pull Requests :("
        label.attributedText = text.with(font: UIFont.boldSystemFont(ofSize: 30), color: .secondary)
        
        if count == 0 {
            emptyView.isHidden = false
            label.isHidden = false
            
        } else {
            emptyView.isHidden = true
            label.isHidden = true
        }
        view.addSubview(emptyView)
        emptyView.addSubview(label)
    }
    
    private func loadData(state: RepoState) {
        RepoAPI.loadPullRequestsByRepo(user: repo?.owner?.login ?? "", repo: repo?.name ?? "", state: state, onComplete: { (response) in
            self.pull = response
            self.count = self.pull.count
            DispatchQueue.main.async {
                self.setupEmptyView()
                self.tableView.reloadData()
            }
        }) { (error) in
            let alert = UIAlertController(title: "Oh oh, something wrong happened :(", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
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
        return count
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

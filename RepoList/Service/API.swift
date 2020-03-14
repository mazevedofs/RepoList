//
//  API.swift
//  RepoList
//
//  Created by Marina Azevedo Ferreira Soares on 13/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import Foundation

enum NetworkError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case statusCode(code: Int)
    case unabledToDecode
}

class RepoAPI {
    
    // MARK: - Properties
    private static let baseURL = "https://api.github.com"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        return config
    }()
    
    private static let session = URLSession(configuration: configuration)
    
    // MARK: - Methods
    class func loadRepoList(language: String, sort: String, page: Int, onComplete: @escaping(RepoResponse) -> Void, onError: @escaping (NetworkError) -> Void) {
        let endpoint = "/search/repositories?q=language:\(language)&sort=\(sort)&page=\(page)"
        //&page=1
        guard let url = URL(string: baseURL + endpoint) else {
            onError(.url)
            return
        }
        let task = URLRequest(url:url)
        
        let dataTask = session.dataTask(with: task) { data, response, error in
            if error == nil {
                guard let response = response as?  HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let apiResponse = try
                            JSONDecoder().decode(RepoResponse.self, from: data)
                            onComplete(apiResponse)
                    } catch {
                        print(error.localizedDescription)
                        onError(.unabledToDecode)
                    }
                } else {
                    onError(.statusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }

    class func loadPullRequestsByRepo(user: String, repo: String, state: String, onComplete: @escaping([PullRequest]) -> Void, onError: @escaping(NetworkError) -> Void){
    
        let endpoint = "/repos/\(user)/\(repo)/pulls?q=\(state)"
        guard let url = URL(string: baseURL + endpoint) else {
            onError(.url)
            return
        }
        
        let task = URLRequest(url:url)
        let dataTask = session.dataTask(with: task) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let apiResponse = try JSONDecoder().decode([PullRequest].self, from: data)
                            onComplete(apiResponse)

                    } catch {
                        print(error.localizedDescription)
                        onError(.unabledToDecode)
                    }
                } else {
                    onError(.statusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
    
}

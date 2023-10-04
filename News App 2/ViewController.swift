//
//  ViewController.swift
//  News App 2
//
//  Created by Aadil Adheesh on 13/05/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var articleListTableView: UITableView!
    var newsData : [NewsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "News Application"
        registerCell()
        
        articleListTableView.dataSource = self
        articleListTableView.delegate = self
        self.articleListTableView.reloadData()
        
      //  var networkManagerInstance = NetworkManager()
        fetchData(at: EndPoint.getUrlForArticlesWithTodaysDate(matching: "Tesla")) {_ in 
            self.articleListTableView.reloadData()
//            switch Result {
//            case .success(let count):
//                print("\(count) unread messages")
//
//            case .failure(let error):
//                print(error)
//            }
    
        }
        
////
        func fetchData(at url: URL, completion: @escaping([NewsData])->(Void)) {

            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error == nil {
                    do {
                        self.newsData = try JSONDecoder().decode([NewsData].self, from: data!)
                        DispatchQueue.main.async {
                            completion(self.newsData)
                        }
                    }
                    catch let decoderError {
                        print(decoderError)
                    }
                    
                }
//                if let error = error {
//                    completion(.failure(error))
//                }
//                if let rcvdData = data {
//                    do {
//                        let newsData = try JSONDecoder().decode(NewsData.self, from: rcvdData)
//
//                        completion(.success(newsData))
//
//                    } catch let decoderError {
//                        completion(.failure(decoderError))
//                    }
//                  }
            }.resume()
        }
////
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell
        {
            cell.feedCell(data: newsData[indexPath.row])
            
            return cell
        }
        else {
            print("Cannot detect data")
            return UITableViewCell(frame: .zero)
        }
    }
    
     func registerCell() {
        articleListTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
}

//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return newsData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell
//        {
//            cell.feedCell(data: newsData[indexPath.row])
//
//            return cell
//        }
//        else {
//            print("Cannot detect data")
//            return UITableViewCell(frame: .zero)
//        }
//    }
//
//    private func registerCell() {
//        articleListTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
//    }
//}

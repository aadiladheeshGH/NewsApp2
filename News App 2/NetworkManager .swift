//
//  NetworkManager .swift
//  News App 2
//
//  Created by Aadil Adheesh on 13/05/23.
//

import Foundation
import UIKit

//struct NetworkManager {
//    var newsData = [Article]()
//
//    func fetchData(at url: URL, completion: @escaping(Result<NewsData, Error>)->Void) {
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//            }
//            if let rcvdData = data {
//                do {
//                    let newsData = try JSONDecoder().decode(NewsData.self, from: rcvdData)
//                    completion(.success(newsData))
//                } catch let decoderError {
//                    completion(.failure(decoderError))
//                }
//            }
//        } .resume()
//    }
//}


//struct NetworkManager {
//    var newsData = [Article]()
//    
//    func fetchData(at url: URL, completion: @escaping(Result<NewsData, Error>)->Void) {
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//            }
//            if let rcvdData = data {
//                do {
//                    let newsData = try JSONDecoder().decode(NewsData.self, from: rcvdData)
//                    
//                    completion(.success(newsData))
//                    
//                } catch let decoderError {
//                    completion(.failure(decoderError))
//                }
//            }
//        } .resume()
//    }
//}

//
//  EndPoint.swift
//  News App 2
//
//  Created by Aadil Adheesh on 13/05/23.
//

import Foundation

struct EndPoint{
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = path
        components.queryItems = queryItems
        print(components.url!)
        return components.url
        
        
    }
    
    let path: String
    let queryItems: [URLQueryItem]
    private static let apiKey = "8242ac17ceb643bcab36de7d52e21fe5"
    
    enum Path {
        case everything
    }
    
    static func getUrlForArticlesWithTodaysDate(matching query: String) -> URL {
        let baseURL = URL(string: "https://newsapi.org/v2/")
        let parameters = URL(string: "\(Path.everything)?q=\(query)&from=\(DateGenerator.getTodaysDate(DateGenerator())())&sortBy=publishedAt&apiKey=\(apiKey)", relativeTo: baseURL)
        print(parameters?.absoluteString)
        
    return parameters!
    }
    
    init(path: String, queryItems: [URLQueryItem]) {
        self.path = path
        self.queryItems = queryItems
    }
}

struct DateGenerator {
    func getTodaysDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var result = dateFormatter.string(from: date)
        
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: date)
        let yesterdayResult = dateFormatter.string(from: yesterday!)
        return yesterdayResult 
    }
}

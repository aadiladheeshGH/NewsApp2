//
//  ArticleModel.swift
//  News App 2
//
//  Created by Aadil Adheesh on 13/05/23.
//

import Foundation

struct NewsData: Decodable{
    let status : String
    let totalResults : Int
    let articles : [Article]
}

struct Article: Decodable{
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

struct Source: Decodable{
    let id: String?
    let name: String
}


extension Article {
    func converttime() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let requiredParameter = DateFormatter()
        requiredParameter.dateFormat = "MMM d, yyyy"
        
        guard let inputDate = inputFormatter.date(from: publishedAt) else {return "Fail"}
        return requiredParameter.string(from: inputDate)
        //self.publishedAt
    }
}

//
//  NewsArticles.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//

import Foundation

struct NewsArticle: Codable {
	var status:String?
	var totalResults: Int?
	var articles:[Article]?
}

//
//  Article.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//

import Foundation

struct Article: Codable {
	var source:Source?
	var author: String?
	var title:String?
	var description:String?
	var url:String?
	var urlToImage:String?
	var publishedAt:String?
	var content:String?
}

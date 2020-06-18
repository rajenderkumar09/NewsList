//
//  ArticleViewModel.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//

import Foundation

struct ArticleViewModel {
	let title:String?
	let author:String?
	let description:String?
	let imagePath:String?

	init(article:Article) {
		self.title = article.title
		self.author = article.author
		self.description = article.description
		self.imagePath = article.urlToImage
	}
}

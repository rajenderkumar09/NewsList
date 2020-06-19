//
//  ArticleViewModel.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//

import Foundation

struct ArticleViewModel {

	private let article: Article

	init(article:Article) {
		self.article = article
	}

	var title:String? {
		return article.title
	}

	var author:String? {
		return article.author
	}

	var description:String? {
		return article.description
	}

	var imagePath:String? {
		return article.urlToImage
	}

	var publishDate:String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
		guard let published = article.publishedAt, let date = dateFormatter.date(from: published) else {
			return nil
		}
		dateFormatter.dateFormat = "MMM dd yyyy HH:MM"
		return dateFormatter.string(from: date)
	}
}

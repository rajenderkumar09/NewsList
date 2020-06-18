//
//  NewsListViewModel.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//

import Foundation
struct NewsListViewModel {
	let totalResults:Int?
	let articles:[ArticleViewModel]?

	init(newsList:NewsArticle) {
		self.totalResults = newsList.totalResults
		self.articles = newsList.articles?.map({return ArticleViewModel(article: $0)}) ?? []
	}
}

//
//  NewsListTests.swift
//  NewsListTests
//
//  Created by Rajender Sharma on 18/06/20.
//

import XCTest
@testable import NewsList

class NewsListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testArticleViewModel() throws {
		//Given
		let article = Article(source: nil, author: "Author Name", title: "News Title", description: "News article description", url: nil, urlToImage: "test.jpg", publishedAt: "2020-06-19T05:00:51Z", content: nil)

		//When
		let articleVM = ArticleViewModel(article: article)

		//Then
		XCTAssertEqual(articleVM.title, article.title)
		XCTAssertEqual(articleVM.author, article.author)
		XCTAssertEqual(articleVM.imagePath, article.urlToImage)
		XCTAssertEqual(articleVM.description, article.description)

		//Test Statically
		XCTAssertEqual(articleVM.title, "News Title")
		XCTAssertEqual(articleVM.author, "Author Name")
		XCTAssertEqual(articleVM.imagePath, "test.jpg")
		XCTAssertEqual(articleVM.description, "News article description")
		XCTAssertNotNil(articleVM.publishDate)
	}

	func testArticleSourceModel() {
		//Given
		let sourceString = "{\"id\":\"1\", \"name\": \"Test Source\"}"
		let sourceData = sourceString.data(using: .utf8)

		//When
		let decoder = JSONDecoder()
		let source = try! decoder.decode(Source.self, from: sourceData!)

		//Then
		XCTAssertEqual(source.id, "1")
		XCTAssertEqual(source.name, "Test Source")
	}


	func testArticleModel() {
		//Given
		let articleString = """
		{
		"source": {
		"id": "1",
		"name": "Test Source"
		},
		"author": "John Smith",
		"title": "Covid-19 Spread",
		"description": "Covid-19 Spread Description",
		"url": "http://www.google.com",
		"urlToImage": "https://test.com/1.jpg",
		"publishedAt": "2020-06-20T10:00:17Z",
		"content": null
		}
		"""
		let articleData = articleString.data(using: .utf8)

		//When
		let decoder = JSONDecoder()
		let article = try! decoder.decode(Article.self, from: articleData!)

		//Then
		XCTAssertEqual(article.author, "John Smith")
		XCTAssertEqual(article.title, "Covid-19 Spread")
		XCTAssertEqual(article.description, "Covid-19 Spread Description")
		XCTAssertEqual(article.url, "http://www.google.com")
		XCTAssertEqual(article.urlToImage, "https://test.com/1.jpg")
		XCTAssertNil(article.content)
	}
}

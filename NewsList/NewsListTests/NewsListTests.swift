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
		let article = Article(source: nil, author: "Author Name", title: "News Title", description: "News article description", url: nil, urlToImage: "test.jpg", publishedAt: nil, content: nil)

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
	}
}

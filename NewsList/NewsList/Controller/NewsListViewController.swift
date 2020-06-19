//
//  NewsListViewController.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//

import UIKit
import Localize_Swift

class NewsListViewController: UIViewController {

	var articles = [ArticleViewModel]()
	var pageSize:Int = 5
	var page:Int = 0
	var totalResults:Int = 0

	@IBOutlet weak var tableView: UITableView! {
		didSet {
			//Set delegate and datasource of the tableview, so that we can layout cell and handle delegate events.
			tableView.delegate = self
			tableView.dataSource = self

			//Register Cell
			let cellNib = UINib(nibName: "ArticleCell", bundle: nil)
			tableView.register(cellNib, forCellReuseIdentifier: "ArticleCell")

			//Set Estimated row Height. As our cell image height is set to 80 so we are setting estimated height to 80
			tableView.estimatedRowHeight = 88

			//Set custom seprator insets
			tableView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
		}
	}

	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		configureView()

		//Call API for fetching news data
		loadMore()
    }

	/// Configure View to display data
	private func configureView() {
		//Right bar button title based on current app language
		let rightButtonTitle = Localize.currentLanguage() == "en" ? "French" : "English"
		self.navigationItem.rightBarButtonItem = self.rightBarButton(with: rightButtonTitle)

		//Call method to update and set content of the view
		updateContent()
	}

	private func rightBarButton(with title:String) -> UIBarButtonItem {
		return UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(switchLanguage(_:)))
	}

	private func updateContent() {
		//Set Navigation Bar title
		self.title = "Todays News".localized()

		//Reload table view
		self.tableView.reloadData()
	}

	func loadMore() {
		// increment `page` by 1 before server call
		page += 1
		self.fetchNews(endPoint: API.headlines)
	}

	@objc func switchLanguage(_ sender: UIBarButtonItem) {

		if Localize.currentLanguage() == "en" {
			Localize.setCurrentLanguage("fr")
			sender.title = "English"
		} else {
			sender.title = "French"
			Localize.setCurrentLanguage("en")
		}
		self.updateContent()
	}

	/// Call API for fetching news data from the API
	/// - Parameter endPoint: name of the API method
	func fetchNews(endPoint:String) {
		//Parameters to be added in the api call
		let params = ["apiKey":API.key, "pageSize":pageSize, "page":page,"category":"technology", "country": "us"] as [String : Any]

		//Show progress indicator while fetching news data
		self.showProgressHUD()

		//Call fetchNewsArticles for fetching data using Service Singleton Class
		Service.shared.fetchNewsArticles(path: endPoint, params: params) { (data, error) in

			//Hide indicator when we got response from the API.
			self.hideProgressHUD()

			//Check for error
			if let err = error {
				self.presentAlert(withTitle: "Error", message: err.localizedDescription)
			} else {
				//Convert model to ViewModel object and assign to array
				let newArticles = data?.articles?.map({return ArticleViewModel(article: $0)}) ?? []

				self.articles.append(contentsOf: newArticles)

				//Set Total results count
				self.totalResults = data?.totalResults ?? 0

				//Reload table view on main queue
				DispatchQueue.main.async {
					self.tableView.reloadData()
				}
			}
		}
	}
}

extension NewsListViewController : UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.articles.count
	}

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if indexPath.row == articles.count - 1, totalResults > articles.count { // last cell
			self.loadMore()
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else {
			return UITableViewCell(style: .default, reuseIdentifier: "ArticleCell")
		}
		let articleVM = self.articles[indexPath.row]
		cell.articleViewModel = articleVM

		cell.selectionStyle = .none

		return cell
	}
}

//
//  Service.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//

import Foundation

typealias JSON = [String:AnyObject]

class Service {
	var session: URLSession = URLSession(configuration: .default)
    static var shared = Service()

	func getQueryString(params : [String : Any])-> String {
        let urlParams = params.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")
        var urlString = "?" + urlParams
        if let url = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            urlString = url
        }
		return urlString
    }

	func fetchNewsArticles(path:String, params: [String:Any], completion: @escaping (NewsArticle?, Error?) -> Void) {

		//Convert params to URL query string
		let query = self.getQueryString(params: params)

		//Make API URL by adding host, path and query string
		guard let url = URL(string: API.host + path + query) else {
			print("Error: Can not create API URL")
			fatalError()
		}

      session.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
          completion(nil, error)
          return
        }
        guard let data = data else {
          completion(nil, NSError(domain: "no data", code: 10, userInfo: nil))
          return
        }
        do {

			let decoder = JSONDecoder()
			let newsArticle = try decoder.decode(NewsArticle.self, from: data)
            completion(newsArticle, nil)
        } catch {
          completion(nil, error)
        }
      }.resume()
    }
}

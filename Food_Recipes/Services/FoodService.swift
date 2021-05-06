//
//  FoodService.swift
//  Food_Recipes
//
//  Created by Rexel_Neeraja on 06/05/21.
//

import Foundation

import Foundation
import UIKit

class FoodService: NSObject {
    
    let apiKey = "9759e7e394124f78a0a1c551b2cc0f78"
    lazy var endPoint: String = {
        return "https://api.spoonacular.com/food/products/search?query=yogurt&apiKey=\(self.apiKey)"
    }()

    func getDataWith(completion: @escaping (Result<[[String: AnyObject]]>) -> Void) {
        
        let urlString = endPoint
        print(urlString)
        
        guard let url = URL(string: endPoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
           guard error == nil else { return }
           guard let data = data else { return }
               do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    guard let itemsJsonArray = json["items"] as? [[String: AnyObject]] else {
                        return completion(.Error(error?.localizedDescription ?? "There are no new Items to show"))
                    }
                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                    }
                }
              } catch let error {
               print(error)
            }
        }.resume()
    }
}

enum Result<T> {
    case Success(T)
    case Error(String)
}

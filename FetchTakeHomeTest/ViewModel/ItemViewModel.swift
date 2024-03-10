//
//  itemViewModel.swift
//  FetchTakeHomeTest
//
//  Created by Kuiduan Zeng on 3/8/24.
//

import Foundation

class ApiCall {
    // get items from https://fetch-hiring.s3.amazonaws.com/hiring.json
    func getItems(completion:@escaping ([Item]) -> ()) {
        guard let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let items = try! JSONDecoder().decode([Item].self, from: data!)
            // Filter out any items where "name" is blank or null.
            var filtered = items.filter { (item) in
                return item.name != nil && item.name != ""
            }
            
            // Sort the results first by "listId" then by "name" when displaying.
            let sortedItems = filtered.sorted { (item1, item2) -> Bool in
                if item1.listId == item2.listId {
                    return item1.name! < item2.name!
                }
                return item1.listId < item2.listId
            }
            
            print(sortedItems)
            
            DispatchQueue.main.async {
                completion(sortedItems)
            }
        }
        .resume()
    }
}

//
//  Item.swift
//  FetchTakeHomeTest
//
//  Created by Kuiduan Zeng on 3/8/24.
//

import SwiftUI

struct Item: Codable, Identifiable {
    let id: Int
    let listId: Int
    let name: String?
}

//
//  History.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 9/4/25.
//

import Foundation

struct HistorySection {

    let title: String
    let transactions: [Transaction]

}

struct Transaction: Codable {

    let id: Int
    let type: String
    let amount: String
    let date: Date

    enum CodingKeys: String, CodingKey {
        case id, type, amount
        case date = "processed_at"
    }

}

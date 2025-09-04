//
//  HistoryViewModel.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 9/4/25.
//

import Foundation

struct HistoryViewModel {

    var sections: [HistorySection]

    init(withTransactions transactions: [Transaction]) {
        sections = Dictionary(grouping: transactions) {
            Calendar.current.component(.month, from: $0.date)
        }.sorted { $0.key > $1.key }
            .map {
                (monthIndex, transactions) -> HistorySection in

                return HistorySection(
                    title: Calendar.current.monthSymbols[monthIndex - 1],
                    transactions: transactions
                )
            }
    }
}

//
//  HistoryViewController.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 9/4/25.
//

import UIKit

class HistoryViewController: UITableViewController {

    // MARK: - Properties

    var sections = [HistorySection]()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        data()

        navigationItem.title = "Games"

        tableView.separatorStyle = .none
        tableView.register(
            HistoryTableViewCell.self,
            forCellReuseIdentifier: String(
                describing: HistoryTableViewCell.self
            )
        )
    }

}

// MARK: - UITableViewDataSource

extension HistoryViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return sections[section].transactions.count
    }

    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return sections[section].title
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: HistoryTableViewCell.self),
                for: indexPath
            ) as? HistoryTableViewCell
        else {
            fatalError("Could not type cast cell into HistoryTableViewCell")
        }

        let section = sections[indexPath.section]
        let transaction = section.transactions[indexPath.row]

        cell.transaction = transaction
        cell.selectionStyle = .none

        return cell
    }

}

// MARK: - Helpers

extension HistoryViewController {

    private func data() {
        let firstSection = HistorySection(
            title: "July",
            transactions: [
                Transaction(
                    id: 1,
                    type: "redeemable",
                    amount: "1",
                    date: Date()
                )
            ]
        )
        let secondSection = HistorySection(
            title: "June",
            transactions: [
                Transaction(
                    id: 1,
                    type: "redeemable",
                    amount: "2",
                    date: Date()
                ),
                Transaction(
                    id: 1,
                    type: "redeemable",
                    amount: "22",
                    date: Date()
                ),
            ]
        )
        let thirdSection = HistorySection(
            title: "May",
            transactions: [
                Transaction(
                    id: 1,
                    type: "redeemable",
                    amount: "3",
                    date: Date()
                ),
                Transaction(
                    id: 1,
                    type: "redeemable",
                    amount: "33",
                    date: Date()
                ),
                Transaction(
                    id: 1,
                    type: "redeemable",
                    amount: "333",
                    date: Date()
                ),
            ]
        )

        sections.append(firstSection)
        sections.append(secondSection)
        sections.append(thirdSection)
    }

}

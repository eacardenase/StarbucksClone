//
//  HistoryViewController.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 9/4/25.
//

import UIKit

class HistoryViewController: UITableViewController {

    // MARK: - Properties

    var viewModel = HistoryViewModel()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "History"
        
        fetchTransactions()

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
        return viewModel.sections.count
    }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.sections[section].transactions.count
    }

    override func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return viewModel.sections[section].title
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

        let section = viewModel.sections[indexPath.section]
        let transaction = section.transactions[indexPath.row]

        cell.transaction = transaction
        cell.selectionStyle = .none

        return cell
    }

}

// MARK: - Helpers

extension HistoryViewController {

    private func fetchTransactions() {
        HistoryService.fetchTransactions { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let transactions):
                self.viewModel.transactions = transactions
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

//
//  HistoryTableViewCell.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 9/4/25.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    // MARK: - Properties

    let starView: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(systemName: "star")
        )

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemYellow

        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)

        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var transaction: Transaction? {
        didSet {
            guard let transaction else { return }

            titleLabel.text = "\(transaction.amount) Stars \(transaction.type)"

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d"
            dateLabel.text = dateFormatter.string(from: transaction.date)
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Helpers

extension HistoryTableViewCell {

    private func setupViews() {
        contentView.addSubview(starView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)

        // starView
        NSLayoutConstraint.activate([
            starView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            starView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            starView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -16
            ),
            starView.heightAnchor.constraint(equalToConstant: 36),
            starView.widthAnchor.constraint(equalTo: starView.heightAnchor),
        ])

        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: starView.trailingAnchor,
                constant: 16
            ),
            titleLabel.centerYAnchor.constraint(
                equalTo: starView.centerYAnchor
            ),
        ])

        // dateLabel
        NSLayoutConstraint.activate([
            dateLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -32
            ),
            dateLabel.centerYAnchor.constraint(equalTo: starView.centerYAnchor),
        ])
    }

}

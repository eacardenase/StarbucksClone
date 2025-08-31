//
//  StarRewardsRow.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/30/25.
//

import UIKit

class StarRewardsRow: UIView {

    // MARK: - Properties

    let starAndPoints = StarAndPoints()

    let descriptionLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    // MARK: - Initializers

    init(numberOfPoints: String, description: String) {
        super.init(frame: .zero)

        starAndPoints.points = numberOfPoints
        descriptionLabel.text = description

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Helpers

extension StarRewardsRow {

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(starAndPoints)
        addSubview(descriptionLabel)

        // starAndPoints
        NSLayoutConstraint.activate([
            starAndPoints.topAnchor.constraint(equalTo: topAnchor),
            starAndPoints.leadingAnchor.constraint(equalTo: leadingAnchor),
            starAndPoints.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        // descriptionLabel
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: starAndPoints.topAnchor
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: starAndPoints.trailingAnchor,
                constant: 4
            ),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: starAndPoints.bottomAnchor
            ),
        ])
    }

}

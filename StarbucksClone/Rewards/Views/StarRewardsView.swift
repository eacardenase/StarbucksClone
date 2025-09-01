//
//  StarRewardsView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/30/25.
//

import UIKit

class StarRewardsView: UIView {

    // MARK: - Properties

    let label: UILabel = {
        let _label = UILabel()

        guard
            let fontDescriptor: UIFontDescriptor = .preferredFontDescriptor(
                withTextStyle: .title3
            ).withSymbolicTraits(.traitBold)
        else {
            fatalError("Cannot create font descriptor with bold trait.")
        }

        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.text = "Rewards you can get with Stars"
        _label.font = UIFont(descriptor: fontDescriptor, size: 0)

        return _label
    }()

    let rewards = [
        Reward(
            numberOfPoints: 25,
            description: "Customize your drink"
        ),
        Reward(
            numberOfPoints: 50,
            description: "Brewed hot coffee, bakery item or hot tea"
        ),
        Reward(
            numberOfPoints: 150,
            description: "Handcrafted drink, hot breakfast or parfait"
        ),
        Reward(
            numberOfPoints: 250,
            description: "Lunch sandwich or protein box"
        ),
        Reward(
            numberOfPoints: 400,
            description: "Select merchandise or at-home coffee"
        ),
    ]

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Helpers

extension StarRewardsView {

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = .systemGroupedBackground
        isHidden = true

        let stackView = UIStackView()

        stackView.addArrangedSubview(label)

        for reward in rewards {
            stackView.addArrangedSubview(
                StarRewardsRow(
                    numberOfPoints: String(reward.numberOfPoints),
                    description: reward.description
                )
            )
        }

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: 16
        )

        addSubview(stackView)

        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}

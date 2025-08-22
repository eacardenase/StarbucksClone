//
//  HomeHeaderView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/21/25.
//

import UIKit

class HomeHeaderView: UIView {

    // MARK: - Properties

    let greetingLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Good afternoon, Jonathan ☀️"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    let inboxButton: UIButton = {
        let button = UIButton(type: .system)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Inbox", for: .normal)
        button.setTitleColor(.label, for: .normal)

        var conf = UIButton.Configuration.plain()
        conf.imagePadding = 8
        button.configuration = conf

        button.setImage(
            UIImage(systemName: "envelope")?.withTintColor(
                .systemGray,
                renderingMode: .alwaysOriginal
            ),
            for: .normal
        )

        return button
    }()

    // MARK: - Initilizers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Helpers

extension HomeHeaderView {

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(greetingLabel)
        addSubview(inboxButton)

        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: topAnchor),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        NSLayoutConstraint.activate([
            inboxButton.topAnchor.constraint(
                equalTo: greetingLabel.bottomAnchor,
                constant: 16
            ),
            inboxButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            inboxButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -8
            ),
        ])
    }

}

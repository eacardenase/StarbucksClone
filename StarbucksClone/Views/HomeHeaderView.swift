//
//  HomeHeaderView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/21/25.
//

import UIKit

protocol HomeHeaderViewDelegate: AnyObject {

    func historyViewTapped()

}

class HomeHeaderView: UIView {

    // MARK: - Properties

    weak var delegate: HomeHeaderViewDelegate?

    let greetingLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Good afternoon, \nEdwin ☀️"
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
        conf.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )

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

    lazy var historyButton: UIButton = {
        let button = UIButton(type: .system)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("History", for: .normal)
        button.setTitleColor(.label, for: .normal)

        var conf = UIButton.Configuration.plain()
        conf.imagePadding = 8
        conf.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )

        button.configuration = conf

        button.setImage(
            UIImage(systemName: "calendar")?.withTintColor(
                .systemGray,
                renderingMode: .alwaysOriginal
            ),
            for: .normal
        )

        button.addTarget(
            self,
            action: #selector(historyButtonTapped),
            for: .touchUpInside
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
        addSubview(historyButton)

        // greetingLabel
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: topAnchor),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            greetingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        // inboxButton
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

        // historyButton
        NSLayoutConstraint.activate([
            historyButton.topAnchor.constraint(equalTo: inboxButton.topAnchor),
            historyButton.leadingAnchor.constraint(
                equalTo: inboxButton.trailingAnchor,
                constant: 24
            ),
            historyButton.bottomAnchor.constraint(
                equalTo: inboxButton.bottomAnchor
            ),
        ])
    }

}

// MARK: - Actions

extension HomeHeaderView {

    @objc func historyButtonTapped(_ sender: UIButton) {
        delegate?.historyViewTapped()
    }

}

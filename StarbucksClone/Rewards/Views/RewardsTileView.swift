//
//  RewardsTileView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/27/25.
//

import UIKit

class RewardsTileView: UIView {

    let balanceView: BalanceView = {
        let view = BalanceView()

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var rewardsButton: UIButton = {
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.plain()

        config.image = UIImage(systemName: "chevron.down")?
            .withConfiguration(
                UIImage.SymbolConfiguration(scale: .small)
            )
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.baseForegroundColor = .label
        config.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )

        let attributedTitle = NSAttributedString(
            string: "Rewards options",
            attributes: [
                .font: UIFont.preferredFont(forTextStyle: .footnote)
            ]
        )

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.configuration = config

        button.addTarget(
            self,
            action: #selector(rewardsOptionsTapped),
            for: .touchUpInside
        )

        return button
    }()

    let rewardsGraphView: UIView = {
        let view = RewardsGraphView()

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let starRewardsView: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen.withAlphaComponent(0.3)

        return view
    }()

    let detailsButton: UIButton = {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()

        config.contentInsets = NSDirectionalEdgeInsets(
            top: 8,
            leading: 16,
            bottom: 8,
            trailing: 16
        )

        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = config
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.layer.cornerRadius = 20

        guard
            let fontDescriptor: UIFontDescriptor = .preferredFontDescriptor(
                withTextStyle: .body
            ).withSymbolicTraits(.traitBold)
        else {
            fatalError("Could not create font descriptor with trait bold")
        }

        let attributedTitle = NSAttributedString(
            string: "Details",
            attributes: [
                .font: UIFont(descriptor: fontDescriptor, size: 0),
                .foregroundColor: UIColor.systemGreen,
            ]
        )

        button.setAttributedTitle(attributedTitle, for: .normal)

        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 300)
    }

}

// MARK: - Helpers

extension RewardsTileView {

    private func setupViews() {
        addSubview(balanceView)
        addSubview(rewardsButton)
        addSubview(rewardsGraphView)
        addSubview(starRewardsView)
        addSubview(detailsButton)

        // balanceView
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])

        // rewardsButton
        NSLayoutConstraint.activate([
            rewardsButton.centerYAnchor.constraint(
                equalTo: balanceView.pointsLabel.centerYAnchor
            ),
            rewardsButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
            ),
        ])

        // rewardsGraphView
        NSLayoutConstraint.activate([
            rewardsGraphView.topAnchor.constraint(
                equalTo: balanceView.bottomAnchor,
                constant: 8
            ),
            rewardsGraphView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rewardsGraphView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        // starRewardsView
        NSLayoutConstraint.activate([
            starRewardsView.topAnchor.constraint(
                equalTo: rewardsGraphView.bottomAnchor,
                constant: 8
            ),
            starRewardsView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 8
            ),
            starRewardsView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -8
            ),
        ])

        // detailsButton
        NSLayoutConstraint.activate([
            detailsButton.topAnchor.constraint(
                equalTo: starRewardsView.bottomAnchor,
                constant: 16
            ),
            detailsButton.leadingAnchor.constraint(
                equalTo: balanceView.leadingAnchor
            ),
            detailsButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
            detailsButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }

}

// MARK: - Actions

extension RewardsTileView {

    @objc func rewardsOptionsTapped(_ sender: UIButton) {
        print(#function)
    }

}

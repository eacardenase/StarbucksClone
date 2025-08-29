//
//  RewardTileView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/27/25.
//

import UIKit

class RewardTileView: UIView {

    let balanceView: BalanceView = {
        let view = BalanceView()

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
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

extension RewardTileView {

    private func setupViews() {
        addSubview(balanceView)

        // balanceView
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: topAnchor),
            balanceView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])

    }

}

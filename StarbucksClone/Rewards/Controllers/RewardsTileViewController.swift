//
//  RewardsTileViewController.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/27/25.
//

import UIKit

class RewardsTileViewController: UIViewController {

    // MARK: - Properties

    let rewardTileView: UIView = {
        let view = RewardsTileView()

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

}

// MARK: - Helpers

extension RewardsTileViewController {

    private func setupViews() {
        view.addSubview(rewardTileView)

        // rewardTileView
        NSLayoutConstraint.activate([
            rewardTileView.topAnchor.constraint(equalTo: view.topAnchor),
            rewardTileView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            rewardTileView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            rewardTileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

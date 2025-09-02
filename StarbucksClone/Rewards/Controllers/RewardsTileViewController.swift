//
//  RewardsTileViewController.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/27/25.
//

import UIKit

class RewardsTileViewController: UIViewController {

    // MARK: - Properties

    let rewardTileView = RewardsTileView()
    weak var delegate: RewardsTileViewDelegate?

    // MARK: - View Lifecycle

    override func loadView() {
        let rewardsView = RewardsTileView()

        rewardsView.delegate = self

        view = rewardsView
    }

}

// MARK: - RewardsTileViewDelegate

extension RewardsTileViewController: RewardsTileViewDelegate {

    func expandableViewDidChange() {
        delegate?.expandableViewDidChange()
    }

}

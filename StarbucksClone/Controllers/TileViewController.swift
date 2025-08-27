//
//  TileViewController.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/26/25.
//

import UIKit

class TileViewController: UIViewController {

    // MARK: - Properties

    let tileView: TileView = {
        let view = TileView()

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

extension TileViewController {

    private func setupViews() {
        view.addSubview(tileView)

        // tileView
        NSLayoutConstraint.activate([
            tileView.topAnchor.constraint(equalTo: view.topAnchor),
            tileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tileView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

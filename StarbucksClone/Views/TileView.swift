//
//  TileView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/25/25.
//

import UIKit

class TileView: UIViewController {

    lazy var label: UILabel = {
        let _label = UILabel()

        _label.translatesAutoresizingMaskIntoConstraints = false

        return _label
    }()

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    // MARK: - Initializers

    init(_ text: String) {
        super.init(nibName: nil, bundle: nil)

        self.label.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Helpers

extension TileView {

    private func setupViews() {
        view.backgroundColor = .systemYellow

        view.addSubview(label)

        // label
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

}

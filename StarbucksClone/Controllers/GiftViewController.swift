//
//  GiftViewController.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/21/25.
//

import UIKit

class GiftViewController: UIViewController {

    // MARK: - Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        tabBarItem.title = "Gift"
        tabBarItem.image = UIImage(
            systemName: "gift.fill",
            withConfiguration: UIImage.SymbolConfiguration(scale: .large)
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Gift"

        view.backgroundColor = .systemGreen
    }

}

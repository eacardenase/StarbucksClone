//
//  HomeViewController.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/21/25.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        tabBarItem.title = "Home"
        tabBarItem.image = UIImage(systemName: "house.fill")?
            .withConfiguration(UIImage.SymbolConfiguration(scale: .large))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink

        navigationItem.title = "Good afternoon, Edwin ☀️"

        setupNavBar()
    }

}

// MARK: - Helpers

extension HomeViewController {

    private func setupNavBar() {
        guard
            let fontDescriptor: UIFontDescriptor = .preferredFontDescriptor(
                withTextStyle: .title1
            ).withSymbolicTraits(.traitBold)
        else { return }

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont(descriptor: fontDescriptor, size: 0)
        ]
    }

}

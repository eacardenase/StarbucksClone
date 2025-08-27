//
//  HomeViewController.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/21/25.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties

    let homeHeaderView = HomeHeaderView()
    var homeHeaderViewTopConstraint = NSLayoutConstraint()

    lazy var scrollView: UIScrollView = {
        let _scrollView = UIScrollView()

        _scrollView.translatesAutoresizingMaskIntoConstraints = false
        _scrollView.delegate = self
        _scrollView.backgroundColor = .systemGroupedBackground

        return _scrollView
    }()

    let stackView: UIStackView = {
        let _stackView = UIStackView()

        _stackView.translatesAutoresizingMaskIntoConstraints = false
        _stackView.axis = .vertical
        _stackView.spacing = 8

        return _stackView
    }()

    let tiles = [
        TileViewController(),
        PlaceholderViewController("Star balance"),
        PlaceholderViewController("Bonus stars"),
        PlaceholderViewController("Try these"),
        PlaceholderViewController("Welcome back"),
        PlaceholderViewController("Uplifting"),
    ]

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

        view.backgroundColor = .systemBackground

        setupViews()
    }

}

// MARK: - Helpers

extension HomeViewController {

    private func setupViews() {
        view.addSubview(homeHeaderView)

        view.addSubview(scrollView)
        scrollView.addSubview(stackView)

        for tile in tiles {
            addChild(tile)
            tile.didMove(toParent: self)

            stackView.addArrangedSubview(tile.view)
        }

        homeHeaderViewTopConstraint = homeHeaderView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 16
        )

        // homeHeaderView
        NSLayoutConstraint.activate([
            homeHeaderViewTopConstraint,
            homeHeaderView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16
            ),
            homeHeaderView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16
            ),
        ])

        // scrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: homeHeaderView.bottomAnchor,
                constant: 8
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 8
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -8
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])

        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor
            ),
            stackView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor
            ),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

        ])

        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            .isActive = true
    }

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

// MARK: - UIScrollViewDelegate

extension HomeViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y

        let headerViewHeight = homeHeaderView.frame.height
        let labelHeight = homeHeaderView.greetingLabel.frame.height
        let buttonHeight = homeHeaderView.inboxButton.frame.height + 24

        let swipingDown = y <= 0
        let shouldSnapLabel = y > 0
        let shouldSnapButton = y > buttonHeight

        UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
            self.homeHeaderView.greetingLabel.alpha = swipingDown ? 1.0 : 0.0

            self.homeHeaderViewTopConstraint.constant =
                shouldSnapLabel ? -labelHeight : 0

            self.view.layoutIfNeeded()
        }.startAnimation()

        UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
            self.homeHeaderView.inboxButton.alpha = y < buttonHeight ? 1 : 0

            self.homeHeaderViewTopConstraint.constant =
                shouldSnapButton
                ? -headerViewHeight
                : shouldSnapLabel ? -labelHeight : 0

            self.view.layoutIfNeeded()
        }.startAnimation()
    }

}

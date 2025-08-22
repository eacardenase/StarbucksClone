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

    lazy var tableView: UITableView = {
        let _tableView = UITableView()

        _tableView.translatesAutoresizingMaskIntoConstraints = false
        _tableView.dataSource = self
        _tableView.delegate = self
        _tableView.rowHeight = 300

        _tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self)
        )

        return _tableView
    }()

    let tiles = [
        "Star balance",
        "Bonus stars",
        "Try these",
        "Welcome back",
        "Uplifting",
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
        view.addSubview(tableView)

        homeHeaderViewTopConstraint = homeHeaderView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor
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

        // tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(
                equalTo: homeHeaderView.bottomAnchor
            ),
            tableView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])

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

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return tiles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NSStringFromClass(UITableViewCell.self),
            for: indexPath
        )

        cell.textLabel?.text = tiles[indexPath.row]
        cell.accessoryType = .disclosureIndicator

        return cell
    }

}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

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

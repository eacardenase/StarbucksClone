//
//  BalanceView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/28/25.
//

import UIKit

class BalanceView: UIView {

    // MARK: - Properties

    let pointsLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12"

        guard
            let fontDescriptor: UIFontDescriptor = .preferredFontDescriptor(
                withTextStyle: .largeTitle
            ).withSymbolicTraits(.traitBold)
        else {
            fatalError("Could not instantiate font descriptor with bold trait.")
        }

        label.font = UIFont(descriptor: fontDescriptor, size: 0)

        return label
    }()

    let starImgeView: UIImageView = {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 15)
        let image = UIImage(
            systemName: "star.fill",
            withConfiguration: imageConfig
        )?.withRenderingMode(.alwaysOriginal)

        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemYellow
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let starBalanceLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.text = "Star Balance"

        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers

extension BalanceView {

    private func setupViews() {
        addSubview(pointsLabel)
        addSubview(starImgeView)
        addSubview(starBalanceLabel)

        // pointsLabel
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])

        // starImgeView
        NSLayoutConstraint.activate([
            starImgeView.leadingAnchor.constraint(
                equalTo: pointsLabel.trailingAnchor
            ),
            starImgeView.centerYAnchor.constraint(
                equalTo: pointsLabel.centerYAnchor,
                constant: -4
            ),
        ])

        // starBalanceLabel
        NSLayoutConstraint.activate([
            starBalanceLabel.topAnchor.constraint(
                equalTo: pointsLabel.bottomAnchor,
            ),
            starBalanceLabel.leadingAnchor.constraint(
                equalTo: pointsLabel.leadingAnchor
            ),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

}

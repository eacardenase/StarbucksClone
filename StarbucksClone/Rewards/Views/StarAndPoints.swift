//
//  StarAndPoints.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/30/25.
//

import UIKit

class StarAndPoints: UIView {

    // MARK: - Properties

    let pointsLabel: UILabel = {
        let label = UILabel()

        guard
            let fontDescriptor: UIFontDescriptor = .preferredFontDescriptor(
                withTextStyle: .callout
            ).withSymbolicTraits(.traitBold)
        else {
            fatalError("Cannot create font descriptor with bold trait.")
        }

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(descriptor: fontDescriptor, size: 0)
        label.textAlignment = .right

        return label
    }()

    var points: String? {
        didSet {
            pointsLabel.text = points
        }
    }

    let starView: UIImageView = {
        let image = UIImage(
            systemName: "star.fill",
            withConfiguration: UIImage.SymbolConfiguration(scale: .small)
        )
        let imageView = UIImageView(image: image)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .systemYellow
        imageView.contentMode = .scaleAspectFit

        return imageView
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
        return CGSize(width: 60, height: 16)
    }
}

// MARK: - Helpers

extension StarAndPoints {

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false

        addSubview(pointsLabel)
        addSubview(starView)

        // pointsLabel
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])

        // starView
        NSLayoutConstraint.activate([
            starView.leadingAnchor.constraint(
                equalTo: pointsLabel.trailingAnchor,
                constant: 2
            ),
            starView.trailingAnchor.constraint(equalTo: trailingAnchor),
            starView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

}

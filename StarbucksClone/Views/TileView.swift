//
//  TileView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/26/25.
//

import UIKit

class TileView: UIView {

    // MARK: - Properties

    let imageView: UIImageView = {
        let _imageView = UIImageView()

        _imageView.translatesAutoresizingMaskIntoConstraints = false
        _imageView.contentMode = .scaleAspectFit
        _imageView.clipsToBounds = true

        return _imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()

        guard
            let fontDescriptor: UIFontDescriptor = .preferredFontDescriptor(
                withTextStyle: .title3
            ).withSymbolicTraits(.traitBold)
        else {
            fatalError("Could not create font descriptor with bold trait.")
        }

        label.font = UIFont(descriptor: fontDescriptor, size: 0)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    let subtitleLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .preferredFont(forTextStyle: .footnote)

        return label
    }()

    let ctaButton: UIButton = {
        var conf = UIButton.Configuration.filled()

        conf.cornerStyle = .capsule
        conf.baseBackgroundColor = .systemGreen
        conf.title = "Order"
        conf.contentInsets = NSDirectionalEdgeInsets(
            top: 8,
            leading: 16,
            bottom: 8,
            trailing: 16
        )

        let button = UIButton(type: .custom)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.7
        button.configuration = conf

        return button
    }()

    private var cornerRadius: CGFloat = 8

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        addShadow()
    }

}

// MARK: - Helpers

extension TileView {

    private func setupViews() {
        backgroundColor = .systemBackground
        layer.cornerRadius = cornerRadius

        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(ctaButton)

        // imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])

        // titleLabel
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: 16
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            ),
        ])

        // subtitleLabel
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 16
            ),
            subtitleLabel.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor
            ),
            subtitleLabel.trailingAnchor.constraint(
                equalTo: titleLabel.trailingAnchor
            ),
        ])

        // ctaButton
        NSLayoutConstraint.activate([
            ctaButton.topAnchor.constraint(
                equalTo: subtitleLabel.bottomAnchor,
                constant: 16
            ),
            ctaButton.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor
            ),
            ctaButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -16
            ),
        ])
    }

    private func addShadow() {
        layer.shadowColor = UIColor.label.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.2
        layer.shadowPath =
            UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }

}

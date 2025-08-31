//
//  RewardsGraphView.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 8/30/25.
//

import UIKit

class RewardsGraphView: UIView {

    // MARK: - Properties

    let imageView = UIImageView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 80)
    }

    // MARK: - View Lifecycle

    override func layoutSubviews() {
        drawRewardsGraph()
    }

}

// MARK: - Helpers

extension RewardsGraphView {

    private func drawRewardsGraph() {
        let frameWidth = frame.width

        let padding: CGFloat = 20
        let dotSize: CGFloat = 12
        let lineWidth: CGFloat = 2
        let numberOfDots: CGFloat = 5
        let numberOfSections = numberOfDots - 1

        let spacingBetweenDots =
            (frameWidth - 2 * padding) / (numberOfSections + 0.5)
        let shortSegmentLength = spacingBetweenDots * 0.25
        let renderer = UIGraphicsImageRenderer(
            size: CGSize(width: frameWidth, height: frame.height)
        )

        var dots = [CGPoint]()
        let labels = ["25", "50", "150", "250", "400"]

        let indicatorOffet: CGFloat = 34
        let yOffset = (dotSize + lineWidth) / 2 + indicatorOffet

        let image = renderer.image { context in
            // Dots definition

            for index in 0...Int(numberOfDots - 1) {
                let x =
                    padding + shortSegmentLength
                    + (spacingBetweenDots * CGFloat(index))

                dots.append(CGPoint(x: x, y: yOffset))
            }

            // Lines between dots

            context.cgContext.setLineWidth(lineWidth)
            context.cgContext.setStrokeColor(UIColor.systemGray4.cgColor)

            // First segment

            let firstShortSegmentBegin = padding
            let firstShortSegmentEnd =
                padding + shortSegmentLength - dotSize / 2

            context.cgContext.move(
                to: CGPoint(x: firstShortSegmentBegin, y: yOffset)
            )
            context.cgContext.addLine(
                to: CGPoint(x: firstShortSegmentEnd, y: yOffset)
            )
            context.cgContext.strokePath()

            // Last segment

            let lastShortSegmentEnd = frameWidth - padding
            let lastShortSegmentBegin = lastShortSegmentEnd - shortSegmentLength

            context.cgContext.move(
                to: CGPoint(x: lastShortSegmentBegin, y: yOffset)
            )
            context.cgContext.addLine(
                to: CGPoint(x: lastShortSegmentEnd, y: yOffset)
            )
            context.cgContext.strokePath()

            context.cgContext.addLines(between: dots)
            context.cgContext.strokePath()

            context.cgContext.setFillColor(UIColor.white.cgColor)

            // Dots

            for dot in dots {
                let dotBounds = CGRect(
                    x: dot.x - (dotSize * 0.5),
                    y: dot.y - (dotSize * 0.5),
                    width: dotSize,
                    height: dotSize
                )

                context.cgContext.addEllipse(in: dotBounds)
                context.cgContext.drawPath(using: CGPathDrawingMode.fillStroke)
            }

            // Progress

            let pointsConsumedBegin = firstShortSegmentBegin
            let pointsConsumedEnd = padding + shortSegmentLength / 2

            context.cgContext.setStrokeColor(UIColor.systemYellow.cgColor)

            context.cgContext.move(
                to: CGPoint(x: pointsConsumedBegin, y: yOffset)
            )
            context.cgContext.addLine(
                to: CGPoint(x: pointsConsumedEnd, y: yOffset)
            )
            context.cgContext.strokePath()

            // Indicator

            let indicatorX = pointsConsumedEnd - 8
            let indicatorY = yOffset - 36
            let star = UIImage(resource: .greenIndicator)

            star.draw(at: CGPoint(x: indicatorX, y: indicatorY))

            // Labels

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            for (i, dot) in dots.enumerated() {
                let string = labels[i]
                let attributedString = NSAttributedString(
                    string: string,
                    attributes: [
                        .font: UIFont.preferredFont(forTextStyle: .footnote),
                        .paragraphStyle: paragraphStyle,
                    ]
                )

                attributedString.draw(
                    with: CGRect(
                        x: dot.x - 15,
                        y: dot.y + 16,
                        width: 30,
                        height: 20
                    ),
                    options: .usesLineFragmentOrigin,
                    context: nil
                )
            }
        }

        imageView.image = image
    }

    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)

        // imageView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

}

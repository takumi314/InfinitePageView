//
//  PageItemView.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/05.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

public class PageItemView: UIView {

    // MARK: - Properties

    let titleLabel = UILabel()

    public var title: String {
        get {
            return titleLabel.text ?? "No title"
        }
    }

    private var color: UIColor = .lightGray

    private let menuItemSeparator = UIView()

    // MARK: - Methods

    public init(frame: CGRect = .zero, title: String) {
        super.init(frame: frame)
        commonInit()
        setTitleText(title)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .lightGray

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0)
        ])
    }

    public func setTitleText(_ text: String) {
        titleLabel.text = text
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.sizeToFit()
    }

    public func setColour(_ colour: UIColor) {
        self.color = colour
    }

    public func highlightMenuItem(_ didHighlightView: Bool) {
        if didHighlightView {
            backgroundColor = color
        } else {
            backgroundColor = .lightGray
        }
    }

    func configure(for pageView: InfinitePageView, view: UIView, index: CGFloat) {

    }

}

extension PageItemView: CGManipulatable { }

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
        backgroundColor = .blue

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

    func highlightMenuItem(_ didHighlightView: Bool) {
        if didHighlightView {
            backgroundColor = .white
        } else {
            backgroundColor = .blue
        }
    }


    func setUpMenuItemView(_ config: MenuItemConfiguration) {
        let labelHeight = config.menuScrollViewHeight - config.indicatorHeight
        titleLabel.frame = CGRect(x: 0.0, y: 0.0, width: config.menuItemWidth, height: labelHeight)

        let xValue = config.menuItemWidth - (config.separatorWidth / 2.0)
        let yValue = config.menuScrollViewHeight * ((1.0 - config.separatorPercentageHeight) / 2.0)
        let separatorHeight = config.menuScrollViewHeight * config.separatorPercentageHeight
        menuItemSeparator.frame = CGRect(x: xValue, y: yValue, width: config.separatorWidth, height: separatorHeight)

        menuItemSeparator.backgroundColor = config.menuItemSeparatorColor

        if config.separatorRoundEdges {
            menuItemSeparator.layer.cornerRadius = menuItemSeparator.frame.width / 2
        }

        menuItemSeparator.isHidden = true
        self.addSubview(menuItemSeparator)
        self.addSubview(titleLabel)
    }

    func configure(for pageView: InfinitePageView, view: UIView, index: CGFloat) {

    }

}

extension PageItemView: CGManipulatable { }

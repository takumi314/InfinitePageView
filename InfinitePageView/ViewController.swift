//
//  ViewController.swift
//  InfinitePageView
//
//  Created by NishiokaKohei on 2018/05/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infinitePageView: InfinitePageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let itemA = PageItemView(title: "Tokyo")
        let contentA = PageContentView()
        infinitePageView.addPage(InfinitePage(index: 0, item: itemA, content: contentA, color: .blue))

        let itemB = PageItemView(title: "Tipei")
        let contentB = PageContentView()
        infinitePageView.addPage(InfinitePage(index: 1, item: itemB, content: contentB, color: .red))

        let itemC = PageItemView(title: "Paris")
        let contentC = PageContentView()
        infinitePageView.addPage(InfinitePage(index: 2, item: itemC, content: contentC, color: .yellow))

        let itemD = PageItemView(title: "London")
        let contentD = PageContentView()
        infinitePageView.addPage(InfinitePage(index: 3, item: itemD, content: contentD, color: .orange))

        let itemE = PageItemView(title: "New York")
        let contentE = PageContentView()
        infinitePageView.addPage(InfinitePage(index: 4, item: itemE, content: contentE, color: .green))

        let itemF = PageItemView(title: "San Francisco")
        let contentF = PageContentView()
        infinitePageView.addPage(InfinitePage(index: 5, item: itemF, content: contentF, color: .purple))

        infinitePageView.commit()
        infinitePageView.scrollToView(at: 0, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


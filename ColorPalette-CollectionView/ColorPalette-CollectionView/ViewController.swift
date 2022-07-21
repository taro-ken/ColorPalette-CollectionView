//
//  ViewController.swift
//  ColorPalette-CollectionView
//
//  Created by 木元健太郎 on 2022/07/14.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var colorlabel: UILabel!
    @IBOutlet weak var mainColorView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainColorView.layer.cornerRadius = 25
    }
}


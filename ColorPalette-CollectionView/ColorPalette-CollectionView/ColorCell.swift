//
//  ColorCell.swift
//  ColorPalette-CollectionView
//
//  Created by 木元健太郎 on 2022/07/14.
//

import UIKit

final class ColorCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.layer.cornerRadius = 35
    }
    
    func configure(model: ColorModel) {
        colorView.backgroundColor = model.color
        colorTitle.text = model.title
    }
}

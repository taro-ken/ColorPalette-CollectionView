//
//  ColorViewController.swift
//  ColorPalette-CollectionView
//
//  Created by 木元健太郎 on 2022/07/14.
//

import UIKit

final class ColorViewController: UIViewController {
    
    
    private let colorCell = "ColorCell"
    private var color:[ColorModel] = [
        ColorModel.init(color: .systemYellow, title: "黄色"),
        ColorModel.init(color: .blue, title: "青"),
        ColorModel.init(color: .black, title: "黒"),
        ColorModel.init(color: .green, title: "緑"),
        ColorModel.init(color: .purple, title: "紫"),
        ColorModel.init(color: .orange, title: "オレンジ")
    ]
    
    @IBOutlet weak var selectColorLabel: UILabel!
    
    @IBOutlet weak var selectColorView: UIImageView!
    
    @IBOutlet weak var colorCollectionView: UICollectionView! {
        didSet {
            colorCollectionView.delegate = self
            colorCollectionView.dataSource = self
            colorCollectionView.register(UINib(nibName: colorCell, bundle: nil), forCellWithReuseIdentifier: colorCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // レイアウトを調整
                let layout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        colorCollectionView.collectionViewLayout = layout
        selectColorView.layer.cornerRadius = 25
    }
    
    
    @IBAction func tappedSave(_ sender: Any) {
        let vc = self.presentingViewController as! ViewController
        vc.colorlabel.text = selectColorLabel.text
        vc.mainColorView.backgroundColor = selectColorView.backgroundColor
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
extension ColorViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return color.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorCell, for: indexPath) as? ColorCell else {
                return UICollectionViewCell()
            }
            cell.configure(model: color[indexPath.item])
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectColorLabel.text = color[indexPath.item].title
        selectColorView.backgroundColor = color[indexPath.item].color
           }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let horizontalSpace : CGFloat = 20
            let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
            return CGSize(width: cellSize, height: cellSize)
        }
}

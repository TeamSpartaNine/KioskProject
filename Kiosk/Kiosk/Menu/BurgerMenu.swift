//
//  BugerMenu.swift
//  Kiosk
//
//  Created by A on 2023/12/28.
//

import UIKit

class BurgerMenu: UICollectionViewCell {
    
    @IBOutlet var mainMenuImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
struct BurGerData{
    private var arr = [UIImage]()
    
    init(){
        createImage()
    }
    mutating func createImage(){
        for index in 0...3{
            if let image = UIImage(named: "Image\(index).png"){arr.append(image)
            }
        }
    }
    var imageArray: [UIImage]{
        return arr
    }
}

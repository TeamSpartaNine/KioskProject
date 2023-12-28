//
//  BugerMenu.swift
//  Kiosk
//
//  Created by A on 2023/12/28.
//

import UIKit

class BugerMenu: UICollectionViewCell {

    @IBOutlet var mainMenuImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
struct Data{
    private var arr = [UIImage]()
    
    init(){
        creatImage()
    }
    
    mutating func creatImage(){
        if let image = UIImage(named: "BulgogiBurger.png"){
            for _ in 0..<40{
                arr.append(image)
            }
        }
    }
    var imageArray: [UIImage]{
        return arr
    }
}

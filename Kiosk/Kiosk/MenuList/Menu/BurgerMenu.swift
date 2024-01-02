//
//  BugerMenu.swift
//  Kiosk
//
//  Created by A on 2023/12/28.
//

import UIKit

class BurgerMenu: UICollectionViewCell {
    @IBOutlet var mainMenuImage: UIImageView!
    
    @IBOutlet var menuPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

struct BurGerData{
    var arr = [DataList]()
    
    init(){
        createImage()
    }
    mutating func createImage(){
        for data in burgerMenu{
            arr.append(DataList(menuImage: data.menuImage, menuName:  data.menuName, menuPrice: data.menuPrice, menuCount: 1 ))
        }
    }
    var dataArray: [DataList]{
        return arr
    }
}

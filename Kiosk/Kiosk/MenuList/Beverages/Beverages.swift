//
//  Beverages.swift
//  Kiosk
//
//  Created by A on 2023/12/28.
//

import UIKit

class Beverages: UICollectionViewCell {
    
    @IBOutlet var beverages: UIImageView!
    
    @IBOutlet var beveragesPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

struct BeveragesData{
    var beveragesArr = [DataList]()
    
    init(){
        createImage()
    }
    mutating func createImage(){
        for data in beverages{
            beveragesArr.append(DataList(menuImage: data.menuImage, menuName: data.menuName, menuPrice: data.menuPrice, menuCount: 1 ))
        }
    }
    var dataArray: [DataList]{
        return beveragesArr
    }
}

//
//  SideMenu.swift
//  Kiosk
//
//  Created by A on 2023/12/28.
//

import UIKit

class SideMenu: UICollectionViewCell {
    @IBOutlet var sideMenu: UIImageView!
    
    @IBOutlet var sideMenuPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

struct SideMenuData{
    var sideArr = [DataList]()
    
    init(){
        createImage()
    }
    mutating func createImage(){
        for data in sideMenu{
            sideArr.append(DataList(menuImage: data.menuImage, menuName: data.menuName, menuPrice: data.menuPrice, menuCount: 1 ))
            }
        }
    var dataArray: [DataList]{
        return sideArr
    }
}


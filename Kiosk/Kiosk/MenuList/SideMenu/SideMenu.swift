//
//  SideMenu.swift
//  Kiosk
//
//  Created by A on 2023/12/28.
//

import UIKit

class SideMenu: UICollectionViewCell {
    @IBOutlet var sideMenu: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
struct SideMenuData{
    private var sideArr = [UIImage]()
    
    init(){
        createImage()
    }
    mutating func createImage(){
        for index in 0...3{
            if let image = UIImage(named: "SideMenu\(index).png"){sideArr.append(image)
            }
        }
    }
    var imageArray: [UIImage]{
        return sideArr
    }
}

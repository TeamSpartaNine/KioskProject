//
//  Beverages.swift
//  Kiosk
//
//  Created by A on 2023/12/28.
//

import UIKit

class Beverages: UICollectionViewCell {
    
    @IBOutlet var beverages: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

struct BeveragesData{
    private var sideArr = [UIImage]()
    
    init(){
        createImage()
    }
    mutating func createImage(){
        for index in 0...6{
            if let image = UIImage(named: "Beverages\(index).png"){sideArr.append(image)
            }
        }
    }
    var imageArray: [UIImage]{
        return sideArr
    }
}

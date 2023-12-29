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
    private var beveragesArr = [UIImage]()
    
    init(){
        createImage()
    }
    mutating func createImage(){
        for index in 0...3{
            if let image = UIImage(named: "Beverages\(index).png"){beveragesArr.append(image)
            }
        }
    }
    var imageArray: [UIImage]{
        return beveragesArr
    }
}

//
//  CategoryStackView.swift
//  Kiosk
//
//  Created by t2023-m0044 on 12/28/23.
//

import UIKit

class CategoryStackView: UIStackView {
    

    @IBAction func TapMainMenu(_ sender: Any) {
        sender
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("CategoryStackView", owner: self, options: nil)?.first as? UIStackView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
    
    func alternativeCustomInit() {
        if let view = UINib(nibName: "CategoryStackView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIStackView {
            view.frame = self.bounds
            addSubview(view)
        }
    }
}


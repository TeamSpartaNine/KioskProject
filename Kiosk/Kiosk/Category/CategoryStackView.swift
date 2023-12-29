//
//  CategoryStackView.swift
//  Kiosk
//
//  Created by t2023-m0044 on 12/28/23.
//

import UIKit

class CategoryStackView: UIStackView {
    
    weak var delegate: CategoryStackViewDelegate?
    
    @IBAction func TapMainMenu(_ sender: Any) {
        print("메인메뉴 선택")
        delegate?.changeToMainMenu()
    }
    @IBAction func TapSideMenu(_ sender: Any) {
        print("사이드메뉴 선택")
        delegate?.changeToMainMenu()
    
    }
    @IBAction func TapBeverage(_ sender: Any) {
        print("음료메뉴 선택")
        delegate?.changeToMainMenu()

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

protocol CategoryStackViewDelegate: AnyObject {
    func changeToMainMenu()
}

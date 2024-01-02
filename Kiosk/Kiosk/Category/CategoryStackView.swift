//
//  CategoryStackView.swift
//  Kiosk
//
//  Created by t2023-m0044 on 12/28/23.
// 언제까지 수정하는 거예요!!

import UIKit

class CategoryStackView: UIStackView {
    
    weak var delegate: CategoryStackViewDelegate?
    
    @IBAction func tapMainMenu(_ sender: Any) {
        print("메인메뉴 선택")

        delegate?.changeToMenu(type: .mainMenu)
    }
    
    @IBAction func tapSideMenu(_ sender: Any) {
        print("사이드메뉴 선택")

        delegate?.changeToMenu(type: .sideMenu)
    }
    
    @IBAction func tapBeverage(_ sender: Any) {
        print("음료메뉴 선택")

        delegate?.changeToMenu(type: .beverages)
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
    func changeToMenu(type: ViewController.MenuType)
}

extension ViewController: CategoryStackViewDelegate {
    func changeToMenu(type: MenuType) {
        print(#function)
        reloadMenu(type: type)
    }
}

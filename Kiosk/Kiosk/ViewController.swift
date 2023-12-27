//
//  ViewController.swift
//  Kiosk
//
//  Created by A on 2023/12/27.
//

import UIKit

class ViewController: UIViewController {

    var count: Int = 0  // 장바구니
    
    @IBOutlet var kioskTitle: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var totalMoney: UILabel!
    
    // 메인메뉴 햄버거
    @IBAction func mainMenu(_ sender: Any) {
        self.count += 1
        self.refreshLabel()
    }
    
    // 사이드메뉴
    @IBAction func sideMenu(_ sender: Any) {
    }
    
    //음료메뉴
    @IBAction func beverages(_ sender: Any) {
    }
    
    //장바구니 카운트
    func refreshLabel(){
        self.totalLabel.text = "\(self.count) 개"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kioskTitle.text = "9조버거"
    
        
        total.text = "총주문내역"
        total.textAlignment = .center
        

        self.refreshLabel()
    }
    //test
    //home test
}


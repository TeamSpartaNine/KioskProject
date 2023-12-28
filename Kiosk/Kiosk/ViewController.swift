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
    
    //장바구니 카운트
    func refreshLabel(){
        self.totalLabel.text = "\(self.count) 개"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        kioskTitle.text = "NineBugers"
    
        
        total.text = "총주문내역"
        total.textAlignment = .center
        

        self.refreshLabel()
    }
    //test
    //home test
}


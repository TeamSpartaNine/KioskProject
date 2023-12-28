//
//  ViewController.swift
//  Kiosk
//
//  Created by A on 2023/12/27.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Buttonxib연결시도1차

    var count: Int = 0  // 장바구니
    
    @IBOutlet var kioskTitle: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var totalMoney: UILabel!
    
    
    @IBOutlet weak var buttonUIView: ButtonUIView!
    
    
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
    
    //최초 호출
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kioskTitle.text = "NineBugers"
    
        
        total.text = "총주문내역"
        total.textAlignment = .center
        buttonUIView.delegate = self


        self.refreshLabel()
    }
    //test
    //home test
}
extension ViewController: ButtonUIViewDelegate {
    func present() {
        
        let cancelAlert = UIAlertController(title: "결제 취소", message: "결제가 취소됩니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "결제 취소", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        cancelAlert.addAction(okAction)
        cancelAlert.addAction(cancelAction)
        
        self.present(cancelAlert, animated: true)
    }
    
    
}

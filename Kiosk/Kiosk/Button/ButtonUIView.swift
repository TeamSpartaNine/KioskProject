//
//  ButtonUIView.swift
//  Kiosk
//
//  Created by t2023-m0099 on 12/28/23.
//
//  스트럭트를 구성하고 델리게이팅을 하면 상속(?)되어 사용할 수 있다?

import UIKit

protocol ButtonUIViewDelegate: AnyObject { //시키는 곳
    func present()
    func payPresent()
}



class ButtonUIView: UIView {
    
    
    weak var delegate: ButtonUIViewDelegate?
    
    
    @IBOutlet weak var cancelbutton: UIButton!
    
    @IBOutlet weak var paybutton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    func customInit() {
        if let view = Bundle.main.loadNibNamed("ButtonUIView", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            addSubview(view)
            
        }
    }
    
    
    
    
    @IBAction func cancelbutton(_ sender: Any) {
        delegate?.present()
        // present뷰컨트롤러의 메서드. 객체간의 소통이다. delegating방식으로? 강의 arc 보기
    }

    @IBAction func pay(_ sender: Any) {
        delegate?.payPresent()
    }
    
}

extension ViewController: ButtonUIViewDelegate {
    func present() {
        
        let cancelAlert = UIAlertController(title: "전체 취소", message: "전체 취소 하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "전체 취소", style: .default, handler: {action in
            print("취소 완료")
            self.totalLabel.text = "0 개"
        })
        
        if totalLabel.text == "0 개" {
            okAction.isEnabled = false
        } else {
            okAction.isEnabled = true
        }
        
        
        cancelAlert.addAction(okAction)
        cancelAlert.addAction(cancelAction)
        
        self.present(cancelAlert, animated: true)
    }
    
    func payPresent() {
        
        let payAlert = UIAlertController(title: "결제 진행", message: "결제 하시겠습니까?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "결제", style: .default, handler: {action in print("결제 완료")
            self.totalLabel.text = "0 개"
        })
        
        if totalLabel.text == "0 개" {
            okAction.isEnabled = false
        } else {
            okAction.isEnabled = true
        }
        
        payAlert.addAction(cancelAction)
        payAlert.addAction(okAction)
        
        self.present(payAlert, animated: true)
    }
}

//다른 대상에게 일을 시킬 수 있다 > 델리게이트 패턴으로 구현할 수 있고 대상 타입으로 선언하는 게 아니고 프로토콜 타입으로 선언하여

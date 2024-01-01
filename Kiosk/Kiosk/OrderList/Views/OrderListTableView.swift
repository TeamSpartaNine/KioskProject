//
//  OrderListTableView.swift
//  Kiosk
//
//  Created by mirae on 1/1/24.
//

import Foundation

class OrderListTableViewCell: UITableViewCell {
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var menuCntLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    var cnt = 1
    var price = 0
    var totalPrice = 0
    var tapMinusButtonClosure : (() -> ())?
    var tapPlusButtonClosure : (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func tapPlustCnt(_ sender: UIButton) {
        tapPlusButtonClosure?() // OrderListView 뷰에 action 전달
    }
    @IBAction func tapMinusCnt(_ sender: UIButton) {
        tapMinusButtonClosure?() // OrderListView 뷰에 action 전달
        
    }
}
extension OrderListTableViewCell{
    private func setUI(){
        menuNameLabel.textAlignment = .left
        menuCntLabel.textAlignment = .center
        menuPriceLabel.textAlignment = .right
    }
    func setOrderList(model : OrderList){ // 메뉴 리스트 데이터 바인딩
        menuNameLabel.text = model.menuName
        menuCntLabel.text = "\(model.cnt)"
        menuPriceLabel.text = "\(model.menuTotalPrice)원"
        cnt = model.cnt
        price = model.menuPrice
    }
}

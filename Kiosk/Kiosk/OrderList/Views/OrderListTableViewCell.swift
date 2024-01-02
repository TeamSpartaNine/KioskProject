//
//  OrderListTableViewCell.swift
//  Kiosk
//
//  Created by mirae on 1/1/24.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {
    @IBOutlet weak var menuCount: UILabel!
    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var menuName: UILabel!
    var cellCount : Int = 0
    var dataList : DataList?
    var plusBtn : (() -> ())? // 매뉴증가 클로저
    var minusBtn : (() -> ())? // 매뉴감소 클로저
    
    @IBAction func plustMenuBtn(_ sender: UIButton) {
        print("+")
        plusBtn?()
    }
    @IBAction func minusMenuBtn(_ sender: UIButton) {
        minusBtn?()
    }
    var mcount: Int = 0
    var price: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

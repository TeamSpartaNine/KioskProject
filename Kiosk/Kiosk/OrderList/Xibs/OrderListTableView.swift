//
//  OrderListTableView.swift
//  Kiosk
//
//  Created by mirae on 1/1/24.
//

import UIKit

class OrderListTableView: UIView, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var OrderListTableView: UITableView!
    
    var orderList : [OrderList] = []
    var cnt = 0
    var tootalPrice = 0
    var orderMenuPrice : [Int] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell
    }
    
}

extension OrderListTableView {
    func setTableView() {
        OrderListTableView.delegate = self
        OrderListTableView.dataSource = self
        OrderListTableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCellid")
    }
    func setOrderList(list : [OrderList]){
        orderList = list
    }
    func setOrderListSum(sum : Int){
        tootalPrice = sum
    }
    
}

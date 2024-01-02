//
//  TableViewExtension.swift
//  NineBurgers
//
//  Created by A on 2024/01/02.
//

import UIKit
//MARK: OrderTableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _order.cart.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell", for: indexPath) as? OrderListTableViewCell {
            let orderItem = _order.cart[indexPath.row]
            cell.menuName.text = orderItem.menuName
            cell.menuPrice.text = "\(orderItem.menuPrice)" + "원"
            cell.menuCount.text = "\(orderItem.menuCount)"

            // 매뉴증감 Closure event
            cell.plusBtn = {
                self._order.cart[indexPath.row].menuCount += 1
                self._order.calculateTotal()
                self.totalLabel.text = "\(self._order.totalQuantity) 개"
                self.totalMoney.text = "\(self._order.totalPrice) 원"
                tableView.reloadData()
            }

            cell.minusBtn = {
                if orderItem.menuCount > 0 {
                    self._order.cart[indexPath.row].menuCount -= 1
                    self._order.calculateTotal()
                    self.totalLabel.text = "\(self._order.totalQuantity) 개"
                    self.totalMoney.text = "\(self._order.totalPrice) 원"
                    tableView.reloadData()
                } else if self._order.totalQuantity == 0 {
                    self._order.clearOrder()
                    tableView.reloadData()
                }
            }
            
            print(_order.cart[indexPath.row].menuCount)
            print(_order.totalPrice)

            return cell
        }
        return UITableViewCell()
    }
}

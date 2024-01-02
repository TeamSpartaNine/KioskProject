//
//  CollectionViewExtension.swift
//  NineBurgers
//
//  Created by A on 2024/01/02.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //셀 선택 셀?
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch currentMenuType {
        case .mainMenu:
            _ = menuCollection.dequeueReusableCell(withReuseIdentifier: "BurgerMenu", for: indexPath) as! BurgerMenu
            print(burgerData.dataArray[indexPath.row])

            if let index = self._order.cart.firstIndex(where: { $0.menuName.contains(burgerData.dataArray[indexPath.row].menuName) }) {
                // The menu item is already in the cart
                self._order.cart[index].menuCount += 1
                self._order.calculateTotal()
                self.totalMoney.text = String(self._order.totalPrice) + " 원"
                self.totalLabel.text = String(self._order.totalQuantity) + " 개"
                
                self.tableView.reloadData()
                self.reloadInputViews()
            } else {
                // The menu item is not in the cart, add it
                self._order.cart.append(burgerData.dataArray[indexPath.row])
                
                self._order.calculateTotal()
                self.totalMoney.text = String(self._order.totalPrice) + " 원"
                self.totalLabel.text = String(self._order.totalQuantity) + " 개"
                
                self.tableView.reloadData()
            }
        case .beverages:
            _ = menuCollection.dequeueReusableCell(withReuseIdentifier: "Beverages", for: indexPath) as! Beverages
            print(beveragesData.dataArray[indexPath.row])

            if let index = self._order.cart.firstIndex(where: { $0.menuName.contains(beveragesData.dataArray[indexPath.row].menuName) }) {
                // The menu item is already in the cart
                self._order.cart[index].menuCount += 1
                self._order.calculateTotal()
                self.totalMoney.text = String(self._order.totalPrice) + " 원"
                self.totalLabel.text = String(self._order.totalQuantity) + " 개"
                
                self.tableView.reloadData()
                self.reloadInputViews()
            } else {
                // The menu item is not in the cart, add it
                self._order.cart.append(beveragesData.dataArray[indexPath.row])
                
                self._order.calculateTotal()
                self.totalMoney.text = String(self._order.totalPrice) + " 원"
                self.totalLabel.text = String(self._order.totalQuantity) + " 개"
                
                self.tableView.reloadData()
            }
        case .sideMenu:
            _ = menuCollection.dequeueReusableCell(withReuseIdentifier: "SideMenu", for: indexPath) as! SideMenu
            print(sideMenuData.dataArray[indexPath.row])

            if let index = self._order.cart.firstIndex(where: { $0.menuName.contains(sideMenuData.dataArray[indexPath.row].menuName) }) {
                // The menu item is already in the cart
                self._order.cart[index].menuCount += 1
                self._order.calculateTotal()
                self.totalMoney.text = String(self._order.totalPrice) + " 원"
                self.totalLabel.text = String(self._order.totalQuantity) + " 개"
                
                self.tableView.reloadData()
                self.reloadInputViews()
            } else {
                // The menu item is not in the cart, add it
                self._order.cart.append(sideMenuData.dataArray[indexPath.row])
                
                self._order.calculateTotal()
                self.totalMoney.text = String(self._order.totalPrice) + " 원"
                self.totalLabel.text = String(self._order.totalQuantity) + " 개"
                
                self.tableView.reloadData()
            }
        }
    }
    
    //아이템 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch currentMenuType {
        case .mainMenu:
            return burgerData.dataArray.count
        case .beverages:
            return beveragesData.dataArray.count
        case .sideMenu:
            return sideMenuData.dataArray.count
        }
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        switch currentMenuType {
        case .mainMenu:
            let burgerCell = menuCollection.dequeueReusableCell(withReuseIdentifier: "BurgerMenu", for: indexPath) as! BurgerMenu
            burgerCell.mainMenuImage.image = UIImage(named: burgerData.dataArray[indexPath.row].menuImage)
                    // 메뉴 이름 및 가격 업데이트
            burgerCell.menuPriceLabel.text = "\(burgerData.dataArray[indexPath.row].menuName) \n \(burgerData.dataArray[indexPath.row].menuPrice)원"
            cell = burgerCell
            
        case .beverages:
            let beveragesCell = menuCollection.dequeueReusableCell(withReuseIdentifier: "Beverages", for: indexPath) as! Beverages
            beveragesCell.beverages.image = UIImage(named: beveragesData.dataArray[indexPath.row].menuImage)
                    // 메뉴 이름 및 가격 업데이트
            beveragesCell.beveragesPrice.text = "\(beveragesData.dataArray[indexPath.row].menuName) \n \(beveragesData.dataArray[indexPath.row].menuPrice)원"
            cell = beveragesCell
            
        case .sideMenu:
            let sideMenuCell = menuCollection.dequeueReusableCell(withReuseIdentifier: "SideMenu", for: indexPath) as! SideMenu
            sideMenuCell.sideMenu.image = UIImage(named: sideMenuData.dataArray[indexPath.row].menuImage)
            // 메뉴 이름 및 가격 업데이트
            sideMenuCell.sideMenuPrice.text = "\(sideMenuData.dataArray[indexPath.row].menuName) \n \(sideMenuData.dataArray[indexPath.row].menuPrice)원"
            cell = sideMenuCell
        }
        return cell
    }
    
}

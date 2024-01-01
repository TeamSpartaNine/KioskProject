//
//  ViewController.swift
//  Kiosk
//
//  Created by A on 2023/12/27.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0  // 장바구니

    @IBOutlet var menuCollection: UICollectionView!
    
    @IBOutlet weak var categoryStackView: CategoryStackView!

    //이미지 데이터들
    private var burgerData = BurGerData()
    private var beveragesData = BeveragesData()
    private var sideMenuData = SideMenuData()

    @IBOutlet weak var buttonUIView: ButtonUIView!
    @IBOutlet var kioskTitle: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var totalMoney: UILabel!
    
    //MARK: OrderList TableView
    @IBOutlet weak var tableView: UITableView!
    var orderList : [OrderList] = []
    //dummy
    let menuData = ["빅맥", "불고기버거", "치즈버거", "치킨버거"]
    let priceData = ["4500", "3400", "5000", "4600"]
    var menuCntData = 1
    
    //셀 식별자 구분
    public enum MenuType: String {
        case mainMenu = "BurgerMenu"
        case beverages = "Beverages"
        case sideMenu = "SideMenu"
    }

    //초기메뉴화면
    var currentMenuType: MenuType = .mainMenu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryStackView.delegate = self
        buttonUIView.delegate = self
        
        
        manuCollectionViewDelegate()
        
        //xib register
        registerNib(for: .mainMenu)
        registerNib(for: .beverages)
        registerNib(for: .sideMenu)

        reloadMenu(type: .mainMenu) // 초기에는 메인메뉴를 보여줌
         
        kioskTitle.text = "🍔NineBugers🍔"
        total.text = "총주문내역"
        total.textAlignment = .center
        
        self.refreshLabel()
        setupFlowLayOut()
        
        //MARK: OrderTableView
        self.tableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func manuCollectionViewDelegate(){
        menuCollection.delegate = self
        menuCollection.dataSource = self
    }
    
    //셀 크기를 바꿉시다
    private func setupFlowLayOut(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero
        
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let halfWidth = UIScreen.main.bounds.width / 2
        flowLayout.itemSize = CGSize(width: halfWidth * 0.5, height: halfWidth * 0.5)
        self.menuCollection.collectionViewLayout = flowLayout
    }
    
    //화면 업데이트
    func reloadMenu(type: MenuType) {
           currentMenuType = type
           menuCollection.reloadData()  //화면 갱신
    }
    
    //장바구니 카운트
    func refreshLabel(){
        self.totalLabel.text = "\(self.count) 개"
    }
    
    //XIB
    private func registerNib(for menuType: MenuType) {
        let nibName: String
        
        switch menuType {
        case .mainMenu:
            nibName = "BurgerMenu"
        case .beverages:
            nibName = "Beverages"
        case .sideMenu:
            nibName = "SideMenu"
        }
        
        let nib = UINib(nibName: nibName, bundle: nil)
        menuCollection.register(nib, forCellWithReuseIdentifier: nibName)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //셀 선택 셀?
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let burgerCell = menuCollection.dequeueReusableCell(withReuseIdentifier: "BurgerMenu", for: indexPath) as! BurgerMenu
        print(burgerData.dataArray[indexPath.row].menuName)
        print(burgerData.dataArray[indexPath.row].menuPrice)
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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

extension ViewController: CategoryStackViewDelegate {
    func changeToMenu(type: MenuType) {
        print(#function)
        reloadMenu(type: type)
    }
}

//MARK: OrderTableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTableViewCell", for: indexPath) as? OrderListTableViewCell {
            cell.menuName.text = menuData[indexPath.row]
            cell.menuPrice.text = priceData[indexPath.row] + "원"
            cell.menuCount.text = "\(menuCntData)"
            
            // 매뉴증감 Closure event
            cell.plusBtn = {
                self.menuCntData += 1
                self.refreshLabel()
                tableView.reloadData()
                print("vc + closure")
                print("\(self.menuCntData)")
            }
            
            cell.minusBtn = {
                if(self.menuCntData > 0) {
                    self.menuCntData -= 1
                    self.refreshLabel()
                    tableView.reloadData()
                    print("vc + closure")
                    print("\(self.menuCntData)")
    
                }
            }
            return cell
        }
        return UITableViewCell()
    }
    
}

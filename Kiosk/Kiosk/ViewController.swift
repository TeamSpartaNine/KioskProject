//
//  ViewController.swift
//  Kiosk
//
//  Created by A on 2023/12/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menuCollection: UICollectionView!
    
    @IBOutlet weak var categoryStackView: CategoryStackView!
    
    
    var count: Int = 0  // 장바구니
    
    //이미지 데이터들
    private var burgerData = BurGerData()
    private var beveragesData = BeveragesData()
    private var sideMenuData = SideMenuData()
    
    
    @IBOutlet var kioskTitle: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var totalMoney: UILabel!
    
    //셀 식별자 구분
    enum MenuType: String {
        case mainMenu = "BurgerMenu"
        case beverages = "Beverages"
        case sideMenu = "SideMenu"
    }

    
    //초기메뉴화면
    var currentMenuType: MenuType = .mainMenu

    
    // 메인메뉴 햄버거
    @IBAction func mainMenu(_ sender: Any) {
        showMenu(type: .mainMenu)
    }
    
    // 사이드메뉴
    @IBAction func sideMenu(_ sender: Any) {
        showMenu(type: .sideMenu)
    }
    
    //음료메뉴
    @IBAction func beverages(_ sender: Any) {
        showMenu(type: .beverages)
    }
    
    //장바구니 카운트
    func refreshLabel(){
        self.totalLabel.text = "\(self.count) 개"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryStackView.delegate = self
        
        manuCollectionViewDelegate()
        
//        registerNib()
        showMenu(type: .mainMenu) // 초기에는 메인메뉴를 보여줌
        

        kioskTitle.text = "NineBugers"
        total.text = "총주문내역"
        total.textAlignment = .center
        
        setupFlowLayOut()
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
        flowLayout.itemSize = CGSize(width: halfWidth * 0.4, height: halfWidth * 0.4)
        self.menuCollection.collectionViewLayout = flowLayout
    }
    
    //화면 업데이트
    func showMenu(type: MenuType) {
           currentMenuType = type
           registerNib(for: type)
           menuCollection.reloadData()  //화면 갱신
    }
    
    //XIB등록
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    //아이템 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch currentMenuType {
        case .mainMenu:
            return burgerData.imageArray.count
        case .beverages:
            return beveragesData.imageArray.count
        case .sideMenu:
            return sideMenuData.imageArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        switch currentMenuType {
        case .mainMenu:
            let burgerCell = menuCollection.dequeueReusableCell(withReuseIdentifier: "BurgerMenu", for: indexPath) as! BurgerMenu
            burgerCell.mainMenuImage.image = burgerData.imageArray[indexPath.row]
            cell = burgerCell
        case .beverages:
            let beveragesCell = menuCollection.dequeueReusableCell(withReuseIdentifier: "Beverages", for: indexPath) as! Beverages
            beveragesCell.beverages.image = beveragesData.imageArray[indexPath.row]
            cell = beveragesCell
        case .sideMenu:
            let sideMenuCell = menuCollection.dequeueReusableCell(withReuseIdentifier: "SideMenu", for: indexPath) as! SideMenu
            cell = sideMenuCell
        }
        return cell
    }
}

extension ViewController: CategoryStackViewDelegate {
    func changeToMainMenu() {
        print(#function)
        menuCollection.reloadData()
    }
    
    
}

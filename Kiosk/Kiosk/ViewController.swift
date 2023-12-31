//
//  ViewController.swift
//  Kiosk
//
//  Created by A on 2023/12/27.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var count: Int = 0  // 장바구니

    @IBOutlet var menuCollection: UICollectionView!
    
    @IBOutlet weak var categoryStackView: CategoryStackView!

    
    //이미지 데이터들
    private var burgerData = BurGerData()
    private var beveragesData = BeveragesData()
    private var sideMenuData = SideMenuData()

   // @IBOutlet weak var buttonUIView: ButtonUIView!
    @IBOutlet var kioskTitle: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var totalMoney: UILabel!

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
   //     buttonUIView.delegate = self
        
        
        manuCollectionViewDelegate()
        
        //xib register
        registerNib(for: .mainMenu)
        registerNib(for: .beverages)
        registerNib(for: .sideMenu)

        reloadMenu(type: .mainMenu) // 초기에는 메인메뉴를 보여줌
         
        kioskTitle.text = "NineBugers"
        total.text = "총주문내역"
        total.textAlignment = .center
        
        self.refreshLabel()
        setupFlowLayOut()
        
        // Add pinch gesture recognizer to menuCollection
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        pinchGesture.delegate = self
        menuCollection.addGestureRecognizer(pinchGesture)
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
<<<<<<< Updated upstream
    @objc func handlePinchGesture(_ recognizer: UIPinchGestureRecognizer) {
        let flowLayout = menuCollection.collectionViewLayout as? UICollectionViewFlowLayout

        switch recognizer.state {
        case .began, .changed:
            // Scale the collection view based on the pinch gesture
            let currentScale = recognizer.scale

            // Calculate the new scale based on pinch gesture
            let newScale = currentScale > 1.0 ? min(1.5, currentScale) : max(1.0, currentScale)
            flowLayout?.invalidateLayout()

            // Adjust the item size based on the pinch scale
            let halfWidth = UIScreen.main.bounds.width / 2
            let newWidth = halfWidth * 0.4 * newScale
            let newHeight = halfWidth * 0.4 * newScale
            flowLayout?.itemSize = CGSize(width: newWidth, height: newHeight)
            menuCollection.setCollectionViewLayout(flowLayout!, animated: false)

        case .ended:
            // Reset any changes if needed
            break

        default:
            break
        }
    }

    // Delegate method to allow simultaneous recognition of gestures
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
            sideMenuCell.sideMenu.image = sideMenuData.imageArray[indexPath.row]
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
=======
>>>>>>> Stashed changes

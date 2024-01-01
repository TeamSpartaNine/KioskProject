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
    
    //결제, 취소 버튼 아울렛
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

        buttonUIView.delegate = self
        
        self.refreshLabel()
        setupFlowLayOut()
        
<<<<<<< Updated upstream
=======
        //MARK: OrderTableView
        self.tableView.register(UINib(nibName: "OrderListTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderListTableViewCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
>>>>>>> Stashed changes
        // 메뉴 컬렉션뷰에 핀치 제스처 추가
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
    @objc func handlePinchGesture(_ recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .began, .changed:
            // 현재 핀치 스케일 계산
            let currentScale = recognizer.scale

            // 새로운 스케일 계산 (최소 0.5, 최대 2.0으로 설정)
            let newScale = currentScale > 1.0 ? min(2.0, currentScale) : max(1.0, currentScale)

            // 변경된 스케일을 적용하여 컬렉션 뷰의 크기 조정
            menuCollection.transform = CGAffineTransform(scaleX: newScale, y: newScale)
            
            // 컬렉션 뷰의 zPosition을 변경하여 다른 뷰보다 위에 오도록 함
             menuCollection.layer.zPosition = 1.0

        case .ended:
            // 변경 완료 시 추가 작업 수행 (옵션)
            break

        default:
            break
        }
    }

    // 동시에 제스처 인식 가능하도록 하는 델리게이트 메서드
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

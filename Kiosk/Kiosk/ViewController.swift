//
//  ViewController.swift
//  Kiosk
//
//  Created by A on 2023/12/27.
//

import UIKit

<<<<<<< Updated upstream
protocol Zoomable {
    func zoomIn()
    func zoomOut()
}

class ViewController: UIViewController {
=======
class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet var menuCollection: UICollectionView!
    
    @IBOutlet weak var categoryStackView: CategoryStackView!

    
    //이미지 데이터들
    private var burgerData = BurGerData()
    private var beveragesData = BeveragesData()
    private var sideMenuData = SideMenuData()

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
>>>>>>> Stashed changes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let zoomButton = ZoomButton()
        
        view.addSubview(zoomButton)
        
        zoomButton.translatesAutoresizingMaskIntoConstraints = false
        zoomButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 36).isActive = true
        zoomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        zoomButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        zoomButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        zoomButton.backgroundColor = nil
        
    }

<<<<<<< Updated upstream
=======
        reloadMenu(type: .mainMenu) // 초기에는 메인메뉴를 보여줌
         
        kioskTitle.text = "NineBugers"
        total.text = "총주문내역"
        total.textAlignment = .center
        
        setupFlowLayOut()
        
        // 핀치 제스처 생성 및 처리
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: nil)
        pinchGesture.delegate = self
        menuCollection.addGestureRecognizer(pinchGesture)

        // 핀치 제스처의 closure 처리
        pinchGesture.addTarget(self, action: #selector(handlePinchGesture(recognizer:)))
    }

    @objc func handlePinchGesture(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .changed {
            // 현재 제스처의 scale 값을 이용하여 필요한 작업을 수행할 수 있습니다.
            let scale = recognizer.scale
            // 예시: 현재 scale 값을 이용하여 UICollectionView 크기 조절
            menuCollection.transform = CGAffineTransform(scaleX: scale, y: scale)
        } else if recognizer.state == .ended || recognizer.state == .cancelled {
            // 제스처가 끝난 경우 또는 취소된 경우, 필요한 작업을 수행할 수 있습니다.
            // 여기서는 예시로 UICollectionView를 원래 크기로 돌리는 코드를 작성합니다.
            menuCollection.transform = .identity
        }
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
>>>>>>> Stashed changes
}

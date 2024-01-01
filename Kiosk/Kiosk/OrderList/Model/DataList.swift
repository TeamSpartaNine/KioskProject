//
//  Data.swift
//  Kiosk
//
//  Created by mirae on 1/1/24.
//

import Foundation

struct DataList {
    var menuImage: String
    var menuName: String
    var menuPrice: Int
    var menuCount: Int
}

class Order {
    var cart: [DataList] = []
    
    lazy var totalPrice: Int = 0
    lazy var totalQuantity: Int = 0
    
    func calculateTotal() {
        totalPrice = 0
        totalQuantity = 0
        
        for `each` in self.cart {
            self.totalPrice += `each`.menuPrice * `each`.menuCount
            self.totalQuantity += `each`.menuCount
        }
    }
    
    func clearOrder() {
        cart.removeAll()
        totalPrice = 0
        totalQuantity = 0
    }
}

let burgerMenu: [DataList] = [
    DataList(menuImage: "BigMac", menuName: "빅맥",menuPrice: 5500, menuCount: 0),
    DataList(menuImage: "GoldenPotatoBurger", menuName: "골든 포테이토 버거",menuPrice: 5900, menuCount: 0),
    DataList(menuImage: "1955Burger", menuName: "1955버거",menuPrice: 7000, menuCount: 0),
    DataList(menuImage: "ProsperityBurgerGoldSpecial", menuName: "행운버거 골드 스폐셜",menuPrice: 7500, menuCount: 0),
    DataList(menuImage: "QuarterPounder", menuName: "쿼터파운드",menuPrice: 6700, menuCount: 0),
    DataList(menuImage: "SupremeShrimpBurger", menuName: "슈슈버거",menuPrice: 4500, menuCount: 0),
    DataList(menuImage: "ShrimpBeefBurger", menuName: "슈비버거",menuPrice: 5500, menuCount: 0),
    DataList(menuImage: "McCrispyDeluxeBurger", menuName: "맥크리스피 버거",menuPrice: 5200, menuCount: 0)]
let sideMenu : [DataList] = [
    DataList(menuImage: "CurlyFries", menuName: "컬리 후라이", menuPrice: 2600, menuCount: 0),
    DataList(menuImage: "TomatoChickenSnackWrap", menuName: "토마토 치킨 스낵랩", menuPrice: 4500, menuCount: 0),
    DataList(menuImage: "Coleslaw", menuName: "코울슬로", menuPrice: 1500, menuCount: 0),
    DataList(menuImage: "ShanghaiChickenSnackWrap", menuName: "상하이 치킨 스낵랩", menuPrice: 5000, menuCount: 0),
    DataList(menuImage: "FrenchFries", menuName: "후렌치 후라이", menuPrice: 2500, menuCount: 0),
    DataList(menuImage: "GoldenMozzarellaCheeseSticks", menuName: "골든 모짜렐라 치즈스틱", menuPrice: 1800, menuCount: 0),
    DataList(menuImage: "McNuggets", menuName: "맥너겟", menuPrice: 1200, menuCount: 0),
    DataList(menuImage: "HashBrown", menuName: "해쉬 브라운", menuPrice: 2500, menuCount: 0)]
let beverages : [DataList] = [
    DataList(menuImage: "IcedVanillaLatte", menuName: "아이스 바닐라 라떼", menuPrice: 4500, menuCount: 0),
    DataList(menuImage: "CafeLatte", menuName: "카페라떼", menuPrice: 3800, menuCount: 0),
    DataList(menuImage: "Americano", menuName: "아메리카노", menuPrice: 2000, menuCount: 0),
    DataList(menuImage: "JejuHallabongChiller", menuName: "제주 한라봉 칠러", menuPrice: 5800, menuCount: 0),
    DataList(menuImage: "PlumPeachChiller", menuName: "자두 천도복숭아 칠러", menuPrice: 6500, menuCount: 0),
    DataList(menuImage: "VanillaLatte", menuName: "바닐라 라떼", menuPrice: 7000, menuCount: 0),
    DataList(menuImage: "Cappuccino", menuName: "카푸치노", menuPrice: 3900, menuCount: 0)]


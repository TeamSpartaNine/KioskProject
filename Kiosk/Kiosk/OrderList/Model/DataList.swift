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
}

let burgerMenu: [DataList] = [DataList(menuImage: "BigMac", menuName: "빅맥",menuPrice: 5500),DataList(menuImage: "GoldenPotatoBurger", menuName: "골든 포테이토 버거",menuPrice: 5900),DataList(menuImage: "1955Burger", menuName: "1955버거",menuPrice: 7000),DataList(menuImage: "ProsperityBurgerGoldSpecial", menuName: "행운버거 골드 스폐셜",menuPrice: 7500),DataList(menuImage: "QuarterPounder", menuName: "쿼터파운드",menuPrice: 6700),DataList(menuImage: "SupremeShrimpBurger", menuName: "슈슈버거",menuPrice: 4500),DataList(menuImage: "ShrimpBeefBurger", menuName: "슈비버거",menuPrice: 5500),DataList(menuImage: "McCrispyDeluxeBurger", menuName: "맥크리스피 디럭스 버거",menuPrice: 5200)]
let sideMenu : [DataList] = [DataList(menuImage: "CurlyFries", menuName: "컬리 후라이", menuPrice: 2600),DataList(menuImage: "TomatoChickenSnackWrap", menuName: "토마토 치킨 스낵랩", menuPrice: 4500),DataList(menuImage: "Coleslaw", menuName: "코울슬로", menuPrice: 1500),DataList(menuImage: "ShanghaiChickenSnackWrap", menuName: "상하이 치킨 스낵랩", menuPrice: 5000),DataList(menuImage: "FrenchFries", menuName: "후렌치 후라이", menuPrice: 2500),DataList(menuImage: "GoldenMozzarellaCheeseSticks", menuName: "골든 모짜렐라 치즈스틱", menuPrice: 1800),DataList(menuImage: "McNuggets", menuName: "맥너겟", menuPrice: 1200),DataList(menuImage: "HashBrown", menuName: "해쉬 브라운", menuPrice: 2500)]
let beverages : [DataList] = [DataList(menuImage: "IcedVanillaLatte", menuName: "아이스 바닐라 라떼", menuPrice: 4500),DataList(menuImage: "CafeLatte", menuName: "카페라떼", menuPrice: 3800),DataList(menuImage: "Americano", menuName: "아메리카노", menuPrice: 2000),DataList(menuImage: "JejuHallabongChiller", menuName: "제주 한라봉 칠러", menuPrice: 5800),DataList(menuImage: "PlumPeachChiller", menuName: "자두 천도복숭아 칠러", menuPrice: 6500),DataList(menuImage: "VanillaLatte", menuName: "바닐라 라떼", menuPrice: 7000),DataList(menuImage: "Cappuccino", menuName: "카푸치노", menuPrice: 3900)]


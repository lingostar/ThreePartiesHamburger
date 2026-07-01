//
//  Combination.swift
//  ThreePartiesHamburger
//
//  Created by Lingostar on 7/1/26.
//

import Foundation

/// 재료 → 공급처 를 Dictionary 로 저장한다.
/// 재료 이름을 키로 주면 공급처를 빠르게 찾을 수 있다. (Dictionary 를 쓰는 진짜 이유)
struct Hamburger {
    /// ⚠️ 하지만 Dictionary 는 순서를 보장하지 않아, 층 순서대로 쌓아 보여줄 수 없다!
    let ingredients: [String: String]

    static let sample = Hamburger(ingredients: [
        "0. 🍞 윗빵": "베를린 바게트",
        "1. 🥬 양상추": "참한 농부",
        "2. 🍅 토마토": "적토마 농장",
        "3. 🧀 치즈": "누가내 치즈",
        "4. 🥩 패티": "밥스 버거스",
        "5. 🍞 아랫빵": "베를린 바게트",
    ])
}

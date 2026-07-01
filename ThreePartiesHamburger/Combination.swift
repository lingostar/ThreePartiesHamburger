//
//  Combination.swift
//  ThreePartiesHamburger
//
//  Created by Lingostar on 7/1/26.
//

import Foundation
import OrderedCollections

/// 재료 → 공급처 매핑을 저장한다.
struct Hamburger {
    /// ✅ 재료 → 공급처 조회는 그대로 두면서, 넣은 순서(층 순서)까지 유지한다.
    let ingredients: OrderedDictionary<String, String>

    static let sample: Hamburger = {
        var ingredients: OrderedDictionary<String, String> = [:]
        ingredients["0. 🍞 윗빵"] = "베를린 바게트"
        ingredients["1. 🥬 양상추"] = "참한 농부"
        ingredients["2. 🍅 토마토"] = "적토마 농장"
        ingredients["3. 🧀 치즈"] = "누가내 치즈"
        ingredients["4. 🥩 패티"] = "밥스 버거스"
        ingredients["5. 🍞 아랫빵"] = "베를린 바게트"
        return Hamburger(ingredients: ingredients)
    }()
}

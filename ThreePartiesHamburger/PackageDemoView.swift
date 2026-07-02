//
//  PackageDemoView.swift
//  ThreePartiesHamburger
//
//  직접 만든 Swift Package(HamburgerKit / BurgerUI)를 SPM으로 import 한 데모.
//

import SwiftUI
import HamburgerKit   // 도메인 로직 (검증·계산·리소스)
import BurgerUI       // 재사용 SwiftUI 컴포넌트 (HamburgerKit에 의존)

struct PackageDemoView: View {
    // 패키지 리소스(ingredients.json)로 조립한 클래식 치즈버거.
    // 빌더 검증을 통과한 값만 만들어지므로 try? 로 안전하게 받는다.
    private let burger = try? Menu.classicCheeseburger()

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Text("HamburgerKit + BurgerUI")
                    .font(.title2.bold())
                Text("직접 만든 패키지를 SPM으로 import 한 화면")
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                if let burger {
                    // BurgerUI 가 제공하는 재사용 컴포넌트 — import 하나로 끝.
                    HamburgerStackView(burger)
                } else {
                    ContentUnavailableView("메뉴를 불러오지 못했어요",
                                           systemImage: "exclamationmark.triangle")
                }
            }
            .padding()
        }
    }
}

#Preview {
    PackageDemoView()
}

//
//  ContentView.swift
//  ThreePartiesHamburger
//
//  Created by Lingostar on 7/1/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DictionaryDemoView()
                .tabItem { Label("Dictionary", systemImage: "list.bullet") }

            PackageDemoView()
                .tabItem { Label("HamburgerKit", systemImage: "shippingbox") }
        }
    }
}

/// OrderedDictionary(swift-collections)로 재료 순서를 보장하는 기존 데모.
struct DictionaryDemoView: View {
    let hamburger = Hamburger.sample

    var body: some View {
        VStack(spacing: 4) {
            Text("🍔 나의 햄버거")
                .font(.title.bold())
                .padding(.bottom, 8)

            // OrderedDictionary 를 그대로 순회 → 넣은 순서(위→아래)가 항상 유지된다!
            ForEach(Array(hamburger.ingredients), id: \.key) { ingredient, supplier in
                HStack {
                    Text(ingredient)
                    Spacer()
                    Text(supplier)
                        .foregroundStyle(.secondary)
                }
                .padding(8)
                .frame(maxWidth: .infinity)
                .background(.yellow.opacity(0.3), in: .rect(cornerRadius: 8))
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

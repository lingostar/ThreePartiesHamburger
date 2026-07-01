//
//  ContentView.swift
//  ThreePartiesHamburger
//
//  Created by Lingostar on 7/1/26.
//

import SwiftUI

struct ContentView: View {
    let hamburger = Hamburger.sample

    var body: some View {
        VStack(spacing: 4) {
            Text("🍔 나의 햄버거")
                .font(.title.bold())
                .padding(.bottom, 8)

            // Dictionary 를 그대로 순회 → 재료-공급처 쌍의 순서가 뒤죽박죽!
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

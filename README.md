# 🍔 ThreePartiesHamburger

Swift 3rd-party 라이브러리 사용법을 설명하는 **교육용 예제** 프로젝트입니다.

[Apple Swift Collections](https://github.com/apple/swift-collections) 를 SPM으로 도입해
`Dictionary` 의 한계를 `OrderedDictionary` 로 해결하는 과정을 커밋 단위로 따라갈 수 있습니다.

## 무엇을 배우나요?

- **재료 → 공급처** 조회처럼 `Dictionary` 가 꼭 필요한 상황을 다룹니다.
- `Dictionary` 는 **순서를 보장하지 않는다**는 사실을 눈으로 확인합니다.
- Swift Package Manager(SPM)로 외부 라이브러리를 **추가**하는 방법을 익힙니다.
- `OrderedDictionary` 로 교체해 **넣은 순서가 항상 유지**되는 것을 확인합니다.

## 커밋으로 따라가기

| 단계 | 내용 |
|---|---|
| 1 | `Dictionary` 로 재료-공급처를 묶으면 층 순서가 뒤죽박죽이 되는 문제 재현 |
| 2 | Swift Collections 패키지를 SPM으로 추가 |
| 3 | `OrderedDictionary` 로 교체해 재료 순서 보장 (문제 해결) |

## 왜 Array 가 아니라 Dictionary 인가?

재료 이름만 나열한다면 순서가 있는 `Array` 로 충분합니다.
하지만 이 예제는 **각 재료의 공급처**를 함께 다룹니다. "🥩 패티의 공급처는?" 처럼
**키로 값을 조회**해야 하므로 `Dictionary` 가 자연스러운 선택입니다.

```swift
let ingredients: [String: String] = [
    "0. 🍞 윗빵": "베를린 바게트",
    "4. 🥩 패티": "밥스 버거스",
    // ...
]
ingredients["4. 🥩 패티"]   // 👉 "밥스 버거스" — 조회는 빠르고 편리하다
```

## 왜 Dictionary 는 순서가 뒤섞일까?

`Dictionary` 는 키를 **해시(hash)** 로 변환해 내부 버킷에 흩뿌려 저장합니다.
덕분에 키로 값을 찾는 속도는 매우 빠르지만(O(1)), 순회 순서는 **넣은 순서와 무관**하며
보안을 위해 실행할 때마다 해시 시드가 바뀌어 순서가 달라질 수도 있습니다.

```swift
for (ingredient, supplier) in ingredients {
    print(ingredient, supplier)   // 👉 순서 보장 없음! 실행마다 층 순서가 뒤죽박죽
}
```

## OrderedDictionary 로 해결

`OrderedDictionary` 는 해시 조회의 빠른 속도는 그대로 유지하면서,
**삽입한 순서**를 배열처럼 함께 기억합니다.

```swift
import OrderedCollections

var ingredients: OrderedDictionary<String, String> = [:]
ingredients["0. 🍞 윗빵"] = "베를린 바게트"
ingredients["1. 🥬 양상추"] = "참한 농부"
// ...
for (ingredient, supplier) in ingredients {
    print(ingredient, supplier)   // ✅ 항상 넣은 순서(위→아래) 그대로
}
```

## SPM으로 패키지 추가하는 법

Xcode 기준:

1. **File ▸ Add Package Dependencies…**
2. 검색창에 `https://github.com/apple/swift-collections.git` 입력
3. Dependency Rule 을 **Up to Next Major Version** 로 두고 **Add Package**
4. 필요한 제품(여기서는 **OrderedCollections**)을 앱 타겟에 추가
5. 코드에서 `import OrderedCollections`

## 요구 사항

- Xcode 26+
- iOS 26 / macOS 26

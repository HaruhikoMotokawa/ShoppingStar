//
//  ShoppingHomeView.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/07.
//

import SwiftUI
/// 買い物ホーム画面
struct ShoppingHomeView: View {
  /// 選択したセレクションの種類
  enum Selection {
    case list
    case map
    /// タブのラベルのテキスト
    var label: String {
      switch self {
        case .list:
          "リスト"
        case .map:
          "マップ"
      }
    }
  }
  /// 選択したタブのセレクション
  @State private var shoppingSelection: Selection = .list
  /// 表示する所有者名（多分後でここは変更）
  @State private var ownerName: String = "はるさん"
  /// 後半のテキスト
  let afterText = "の買い物"
  /// ダミーの買い物情報（後で撤去）
  let shoppings: [String] = ["はるさん", "ハルサン", "ｈａｒｕｓａｎｎ"]
  // MARK: - body
  var body: some View {
    GeometryReader { geometry in
      VStack {
        // 買い物情報選択メニュー
        Menu {
          ForEach(shoppings, id: \.self) { shopping in
            Button {
              ownerName = shopping
            } label: {
              Text(shopping)
            }
          }
        } label: {
          Text(ownerName + afterText)
        }
        // 上タブ
        Picker("", selection: $shoppingSelection) {
          Text(Selection.list.label)
            .tag(Selection.list)
          Text(Selection.map.label)
            .tag(Selection.map)
        }
        .pickerStyle(.segmented)
        .colorMultiply(.blue)
        Divider()
        // 切り替える画面
        TabView(selection: $shoppingSelection) {
          ShoppingListView(
            screenWidth: .constant(geometry.size.width),
            screenHeight: .constant(geometry.size.height)
          )
            .tag(Selection.list)
          ShoppingMapView(
            screenHeight: .constant(geometry.size.height),
            screenWidth: .constant(geometry.size.width)
          )
            .tag(Selection.map)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        Spacer()
      } // VStack
    } // GeometryReader
  } // body
}

#Preview {
  ShoppingHomeView()
}

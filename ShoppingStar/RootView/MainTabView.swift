//
//  MainTabView.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/07.
//

import SwiftUI
/// 主要タブ画面
struct MainTabView: View {
  /// 選択したセレクションの種類
  enum Selection {
    case shopping
    case editing
    case create
    case setting
    case account
    /// タブのラベルのテキスト
    var label: String {
      switch self {
        case .shopping:
          "買い物"
        case .editing:
          "買い物編集"
        case .create:
          "商品追加"
        case .setting:
          "設 定"
        case .account:
          "アカウント関連"
      }
    }
    /// タブアイコンのシンボル名
    var systemImage: String {
      switch self {
        case .shopping:
          "cart"
        case .editing:
          "square.and.pencil"
        case .create:
          "plus.circle"
        case .setting:
          "gear"
        case .account:
          "person"
      }
    }
  }
  /// 選択したタブのセレクション
  @State private var selection: Selection = .shopping
  /// 最後に選択したセレクションを保持
  @State private var lastSelection: Selection = .shopping
  /// 商品追加画面をモーダル遷移させるためのフラグ
  @State private var isCreateItemViewIsPresented: Bool = false
  // MARK: - body
  var body: some View {
    TabView(selection: $selection) {
      // 買い物ホーム画面
      ShoppingHomeView()
        .tabItem {
          Label(
            Selection.shopping.label,
            systemImage: "cart"
          )
        }
        .tag(Selection.shopping)
      // 編集ホーム画面
      EditingHomeView()
        .tabItem {
          Label(
            Selection.editing.label,
            systemImage: "square.and.pencil"
          )
        }
        .tag(Selection.editing)
      // 商品追加
      Text("CreateItemView")
        .tabItem {
          Label(
            Selection.create.label,
            systemImage: "plus.circle"
          )
        }
        .tag(Selection.create)
        .sheet(isPresented: $isCreateItemViewIsPresented)  {
          CreateItemView()
        }
      // 設定ホーム画面
      SettingHomeView()
        .tabItem {
          Label(
            Selection.setting.label,
            systemImage: "gear"
          )
        }
        .tag(Selection.setting)
      // アカウントホーム画面
      AccountHomeView()
        .tabItem {
          Label(
            Selection.account.label,
            systemImage: "person"
          )
        }
        .tag(Selection.account)
    } // TabView
    .onChange(of: selection) { _ in
      switch selection {
        case .shopping:
          lastSelection = selection
        case .editing:
          lastSelection = selection
        case .create:
          selection = lastSelection
          isCreateItemViewIsPresented = true
        case .setting:
          lastSelection = selection
        case .account:
          lastSelection = selection
      } // switch
    } // onChange
  } // body
}

#Preview {
  MainTabView()
}

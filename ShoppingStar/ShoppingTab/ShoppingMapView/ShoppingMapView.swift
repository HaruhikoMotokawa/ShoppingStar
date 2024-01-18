//
//  ShoppingMapView.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/08.
//

import SwiftUI
/// 買い物マップ
struct ShoppingMapView: View {
  /// 買い物リストを表示するフラグ
  @State private var isShoppingListViewPresented: Bool = false
  /// 画面の縦サイズ
  @Binding var screenHeight: CGFloat
  /// 画面の横サイズ
  @Binding var screenWidth: CGFloat
  /// 買い物を開始する位置を右にするフラグ、falseで左
  var isStartShoppingFromRight: Bool = true
  /// 売り場の配列
  var salesFloors: [SalesFloor] = SalesFloor.default
  /// マップの上段に位置する売り場の配列で番地は 2,7,14
  var topRowFloors: [SalesFloor] {
    let floors = salesFloors.filter {
      $0.houseNumber == 2 || $0.houseNumber == 7 || $0.houseNumber == 14
    }
    return floors.reversed()
  }
  /// マップの中段に位置する売り場の配列で番地は 1,3,6,8,11,13,15
  var centerRowFloors: [SalesFloor] {
    let floors = salesFloors.filter {
      $0.houseNumber == 1 || $0.houseNumber == 3 || $0.houseNumber == 6
      || $0.houseNumber == 8 || $0.houseNumber == 11 || $0.houseNumber == 13
      || $0.houseNumber == 15
    }
    return floors.reversed()
  }
  /// マップの下段に位置する売り場の配列で番地は 0,4,5,9,10,12,16
  var bottomRowFloors: [SalesFloor] {
    let floors = salesFloors.filter {
      $0.houseNumber == 0 || $0.houseNumber == 4 || $0.houseNumber == 5
      || $0.houseNumber == 9 || $0.houseNumber == 10 || $0.houseNumber == 12
      || $0.houseNumber == 16
    }
    return floors.reversed()
  }
  // MARK: - body
  var body: some View {
    ScrollView {
      VStack {
        VStack(spacing: screenHeight * 0.05) {
          // 売り場上段
          HStack {
            ForEach(topRowFloors) { floor in
              horizontalSalesFloorButton(
                colorTypeRawValue: floor.colorTypeRawValue,
                name: floor.name
              )
            }
          } // HStack
          .padding(.top, 10)
          // 売り場中段
          HStack {
            ForEach(centerRowFloors) { floor in
              verticalSalesFloorButton(
                colorTypeRawValue: floor.colorTypeRawValue,
                name: floor.name
              )
            }
          } // HStack
          // 売り場下段
          HStack {
            ForEach(bottomRowFloors) { floor in
              verticalSalesFloorButton(
                colorTypeRawValue: floor.colorTypeRawValue,
                name: floor.name
              )
            }
          } // HStack
        } // VStack
        startSection()
        Text("入口 ＆ レジ")
          .frame(width: screenWidth * 0.9, height: screenHeight * 0.05 )
          .background(RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 2.0)
            .foregroundStyle(.primary))
      } // VStack
    } // ScrollView
    .sheet(isPresented: $isShoppingListViewPresented,
           content: {
      ShoppingListView(
        screenWidth: $screenWidth,
        screenHeight: $screenHeight
      )
    })
  } // body
}
// MARK: - func View
private extension ShoppingMapView {
  /// 横の売り場
 @ViewBuilder
  func horizontalSalesFloorButton(colorTypeRawValue: Int, name: String) -> some View {
    let color = SalesFloorColorType(rawValue: colorTypeRawValue)?.color ?? Color.white
    Button {
      /*ボタンタップでリストを表示するよ*/
      isShoppingListViewPresented.toggle()
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 20.0)
          .foregroundStyle(color)
          .frame(width: screenWidth * 0.31, height: screenHeight * 0.05)
          .background(RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 2.0)
            .foregroundStyle(.black))
          .compositingGroup()
          .shadow(color: .gray, radius: 3, x: 10, y: 10)
        Text(name)
          .fontWeight(.semibold)
          .tint(.primary)
      } // ZStack
    } // Button&label
  }
  /// 縦の売り場
  @ViewBuilder
  func verticalSalesFloorButton(colorTypeRawValue: Int, name: String) -> some View {
    let color = SalesFloorColorType(rawValue: colorTypeRawValue)?.color ?? Color.white
    Button {
      /*ボタンタップでリストを表示するよ*/
      isShoppingListViewPresented.toggle()
    } label: {
      ZStack {
        HStack() {
          verticallyLongRectangle(color: color)
          Spacer()
          verticallyLongRectangle(color: color)
        }
        VerticalText(text: name)
          .fontWeight(.semibold)
          .tint(.primary)
      } // ZStack
    } // Button&label
  }
  /// 縦に長い長方形
  func verticallyLongRectangle(color: Color) -> some View {
    RoundedRectangle(cornerRadius: 20.0)
      .foregroundStyle(color)
      .frame(width: screenWidth * 0.02, height: screenHeight * 0.3)
      .background(RoundedRectangle(cornerRadius: 20)
        .stroke(lineWidth: 2.0)
        .foregroundStyle(.black))
      .compositingGroup()
      .shadow(color: .gray, radius: 3, x: 10, y: 10)
  }
  /// スタートセクション
  func startSection() -> some View {
    HStack {
      if isStartShoppingFromRight {
        Spacer()
        startView()
      } else {
        startView()
        Spacer()
      }
    } // HStack
    .frame(width: screenWidth, height: screenHeight * 0.05)
  }
  /// 開始位置の表示
  func startView() -> some View {
    Label {
      Text("スタート")
        .font(.title2)
        .fontWeight(.semibold)
        .tint(.primary)
    } icon: {
      Image(systemName: "cart.fill")
    }
    .padding(.vertical, 3)
    .padding(.horizontal, 5)
    .background(RoundedRectangle(cornerRadius: 20)
      .stroke(lineWidth: 2.0)
      .foregroundStyle(.primary)) //  .primaryだとライト＆ダークモードに対応してくれる
  }
}

#Preview {
  ShoppingMapView(screenHeight: .constant(932), screenWidth: .constant(430))
}

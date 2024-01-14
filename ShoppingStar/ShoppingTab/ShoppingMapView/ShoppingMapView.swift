//
//  ShoppingMapView.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/08.
//

import SwiftUI
/// 買い物マップ
struct ShoppingMapView: View {

  var screenHeight: CGFloat = 932
  var screenWidth: CGFloat = 430
  var isStartShoppingFromRight: Bool = true
  // MARK: - body
  var body: some View {
    ScrollView {
      VStack {
        VStack(spacing: screenHeight * 0.05) {
          HStack {
            ForEach(1..<4) { _ in
              horizontalSalesFloorButton()
            }
          } // HStack
          HStack {
            ForEach(1..<8) { _ in
              verticalSalesFloorButton(color: .blue)
            }
          } // HStack
          HStack {
            ForEach(1..<8) { _ in
              verticalSalesFloorButton(color: .red)
            }
          } // HStack
        } // VStack
        startSection()
        Text("入口 ＆ レジ")
          .frame(width: screenWidth * 0.9, height: screenHeight * 0.05 )
          .background(RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 2.0)
            .foregroundStyle(.black))
      } // VStack
    }
  } // body
}
// MARK: - func View
private extension ShoppingMapView {
  /// 横の売り場
  func horizontalSalesFloorButton() -> some View {
    Button {
      /*ボタンタップでリストを表示するよ*/
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 20.0)
          .foregroundStyle(.brown)
          .frame(width: screenWidth * 0.28, height: screenHeight * 0.05)
          .background(RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 2.0)
            .foregroundStyle(.black))
          .compositingGroup()
          .shadow(color: .gray, radius: 3, x: 10, y: 10)
        Text("売り場コーナー")
          .fontWeight(.semibold)
          .tint(.black)
      } // ZStack
    } // Button&label
  }
  /// 縦の売り場
  func verticalSalesFloorButton(color: Color) -> some View {
    Button {
      /*ボタンタップでリストを表示するよ*/
    } label: {
      ZStack {
        HStack() {
          verticallyLongRectangle(color: color)
          Spacer()
          verticallyLongRectangle(color: color)
        }
        VerticalText(text: "売り場コーナー")
          .fontWeight(.semibold)
          .tint(.black)
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
    .frame(width: .infinity, height: screenHeight * 0.05)
  }
  /// 開始位置の表示
  func startView() -> some View {
    Label {
      Text("スタート")
        .font(.title2)
        .fontWeight(.semibold)
    } icon: {
      Image(systemName: "cart.fill")
    }
    .padding(.vertical, 3)
    .padding(.horizontal, 5)
    .background(RoundedRectangle(cornerRadius: 20)
      .stroke(lineWidth: 2.0)
      .foregroundStyle(.black))
  }
}

#Preview {
  ShoppingMapView()
}

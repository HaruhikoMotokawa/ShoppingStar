//
//  ItemCellView.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/08.
//

import SwiftUI
/// 商品を表示するセル
struct ItemCellView: View {
  /// 画面の横サイズ
  @Binding var screenWidth: CGFloat
  /// 画面の縦サイズ
  @Binding var screenHeight: CGFloat
  /// 商品情報
  let item: Item
  /// 売り場の配列
  let salesFloors: [SalesFloor]
  /// itemに登録されている番地とsalesFloorsの番地で合致する売り場を設定
  var salesFloor: SalesFloor {
    let salesFloor = salesFloors.filter { $0.houseNumber == item.houseNumber }
    return salesFloor.first ?? SalesFloor.`init`
  }
  /// 売り場のカラーを生成
  var salesFloorColor: Color {
    SalesFloorColorType(rawValue: salesFloor.colorTypeRawValue)?.color ?? Color.white
  }
  // MARK: - body
  var body: some View {
    HStack(spacing: 20) {
      Image(systemName: "circle")
      cell()
//              Image(systemName: "circle")
    } // HStack
    .padding(.horizontal, 10)
  } // body
}
// MARK: - func View
private extension ItemCellView {
  /// セル
  @ViewBuilder func cell() -> some View{
    // 通常のRGB値は0〜255だが、Swiftだと0〜1.0で入力する。なのでRGB値/255の値を入れる
    let red: Double = 217/255
    let green: Double = 217/255
    let blue: Double = 217/255
    let cellColor = Color(red: red, green: green, blue: blue)
    // 上記のようにView関数内にローカル定数作るなら以下のように最初にreturnつけないといけない
    // または@/ViewBuilderつければいないからこっちの方がいいのか
    VStack {
      HStack {
        VStack(alignment: .leading, spacing: 5) {
          Text(salesFloor.name)
            .fontWeight(.semibold)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(salesFloorColor)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
          Text(item.name)
            .font(.title2)
            .fontWeight(.semibold)
          Text(String(item.amount) + item.unit)
            .fontWeight(.semibold)
        } // VStack
        Spacer()
        imageView()
      } // HStack
      remarksText()
    } // VStack
    .padding(.vertical, 10)
    .padding(.horizontal, 15)
    // ここの色をRGBで
    .background(cellColor)
    .clipShape(RoundedRectangle(cornerRadius: 25.0))
    .compositingGroup() // VIewの複数の要素をグループ化すると背景にだけ影をつけれる
    .shadow(color: .gray, radius: 3, x: 10, y: 10)
  }
  /// 画像のView
  @ViewBuilder func imageView() -> some View {
    if let url = item.dummyImageUrl {
      Image(url)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: screenWidth/5)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .background(RoundedRectangle(cornerRadius: 10)
        .stroke(lineWidth: 2.0)
        .foregroundStyle(.black))
    } else {
      noImageView()
    }
  }
  /// 画像がない場合の代替えイメージ
  func noImageView() -> some View {
    ZStack {
      Rectangle()
        .aspectRatio(contentMode: .fit)
        .frame(width: screenWidth/5)
        .foregroundStyle(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .background(RoundedRectangle(cornerRadius: 10)
          .stroke(lineWidth: 2.0)
          .foregroundStyle(.black))
      VStack {
        Text("No")
          .font(.caption2)
          .fontWeight(.bold)
          .foregroundStyle(.white)
        Text("Image")
          .font(.caption2)
          .fontWeight(.bold)
          .foregroundStyle(.white)
      } // VStack
    } // ZStack
  } // VStack
  /// 備考を表示するViewで備考がなければ生成されない
  @ViewBuilder func remarksText() -> some View {
    if let remarksText = item.remarks {
      VStack(alignment: .leading) {
        Divider()
        Text(remarksText)
          .fontWeight(.light)
      }
    }
  }
}

#Preview {
  ItemCellView(
    screenWidth: .constant(375),
    screenHeight: .constant(680),
    item: .init(
      id: nil,
      name: "人参",
      houseNumber: 1,
      amount: 1,
      unit: "本",
      imageUrl: nil,
      remarks: "これはどうでしょう、長々と描いて見てますが、こんなに長く描いたらどうゆうふうに表示されますか？",
      authorId: "A",
      creationDay: Date(),
      dummyImageUrl: .hobby2
    ),
    salesFloors: SalesFloor.default
  )
}

//
//  Item.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/13.
//

import Foundation
/// 商品情報
struct Item: Identifiable {
  /// FirestoreのドキュメントID
  var id: String?
  /// 商品名
  var name: String
  /// 売り場の番地
  var houseNumber: Int
  /// 商品の数
  var amount: Int
  /// 商品の単位
  var unit: String
  /// 商品画像のFireStrageからのダウンロードURL、nil許容
  var imageUrl: String?
  /// 商品の備考、nil許容
  var remarks: String?
  /// 作成者のid、アプリ内では使う予定はなし
  var authorId: String
  /// 作成日、アプリ内では使う予定はなし
  var creationDay: Date
  // これはいずれ削除する
  var dummyImageUrl: ImageResource?
}

extension Item {
  /// 初期設定
  static let `init`: Item = Item(
    name: "読み込み失敗",
    houseNumber: 0,
    amount: 0,
    unit: "個",
    authorId: "",
    creationDay: Date(),
    dummyImageUrl: .cook1
  )
  /// ダミー
  static let dummy: [Item] = [
    Item(
      id: UUID().uuidString,
      name: "豚肉",
      houseNumber: 1,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date(), dummyImageUrl: .hobby2
    ),
    Item(
      id: UUID().uuidString,
      name: "たまご",
      houseNumber: 5,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date()
    ),
    Item(
      id: UUID().uuidString,
      name: "人参",
      houseNumber: 9,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date()
    ),
    Item(
      id: UUID().uuidString,
      name: "パン粉",
      houseNumber: 10,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date(), dummyImageUrl: .work3
    ),
    Item(
      id: UUID().uuidString,
      name: "牛乳プリン",
      houseNumber: 3,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date(), dummyImageUrl: .work3
    ),
    Item(
      id: UUID().uuidString,
      name: "牛乳プリン",
      houseNumber: 2,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date(), dummyImageUrl: .cook1
    ),
    Item(
      id: UUID().uuidString,
      name: "牛乳プリン",
      houseNumber: 9,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date(), dummyImageUrl: .cook4
    ),
    Item(
      id: UUID().uuidString,
      name: "牛乳プリン",
      houseNumber: 7,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date(), dummyImageUrl: .cook3
    ),
    Item(
      id: UUID().uuidString,
      name: "牛乳プリン",
      houseNumber: 16,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date(), dummyImageUrl: .cook1
    ),
    Item(
      id: UUID().uuidString,
      name: "牛乳プリン",
      houseNumber: 13,
      amount: 1,
      unit: "パック",
      authorId: "",
      creationDay: Date(), dummyImageUrl: .cook2
    ),
  ]
}

//
//  SalesFloor.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/13.
//

import Foundation
/// 売り場
struct SalesFloor {
  /// FirestoreのドキュメントID
  var id: String?
  /// 番地
  var houseNumber: Int
  /// 売り場名
  var name: String
  /// 売り場の色の行番号
  var colorTypeRawValue: Int
}

extension SalesFloor {
  /// 初期設定
  static let `init` = SalesFloor(
    houseNumber: 0,
    name: "読み込み出来ませんでした",
    colorTypeRawValue: 0
  )
  /// デフォルト設定
  static let `default`: [SalesFloor] = [
    SalesFloor(
      houseNumber: 0,
      name: "野菜",
      colorTypeRawValue: 0
    ),
    SalesFloor(
      houseNumber: 1,
      name: "魚介類",
      colorTypeRawValue: 1
    ),
    SalesFloor(
      houseNumber: 2,
      name: "肉類",
      colorTypeRawValue: 2
    ),
    SalesFloor(
      houseNumber: 3,
      name: "お菓子",
      colorTypeRawValue: 3
    ),
    SalesFloor(
      houseNumber: 4,
      name: "卵・冷蔵洋菓子",
      colorTypeRawValue: 4
    ),
    SalesFloor(
      houseNumber: 5,
      name: "乳製品",
      colorTypeRawValue: 5
    ),
    SalesFloor(
      houseNumber: 6,
      name: "酒類",
      colorTypeRawValue: 6
    ),
    SalesFloor(
      houseNumber: 7,
      name: "調味料",
      colorTypeRawValue: 7
    ),
    SalesFloor(
      houseNumber: 8,
      name: "レトルト・カップ麺",
      colorTypeRawValue: 8
    ),
    SalesFloor(
      houseNumber: 9,
      name: "冷凍品",
      colorTypeRawValue: 9
    ),
    SalesFloor(
      houseNumber: 10,
      name: "日用品",
      colorTypeRawValue: 10
    ),
    SalesFloor(
      houseNumber: 11,
      name: "米・和菓子",
      colorTypeRawValue: 11
    ),
    SalesFloor(
      houseNumber: 12,
      name: "パスタ・缶詰",
      colorTypeRawValue: 12
    ),
    SalesFloor(
      houseNumber: 13,
      name: "調味料",
      colorTypeRawValue: 13
    ),
    SalesFloor(
      houseNumber: 14,
      name: "お茶・珈琲",
      colorTypeRawValue: 14
    ),
    SalesFloor(
      houseNumber: 15,
      name: "お惣菜",
      colorTypeRawValue: 15
    ),
    SalesFloor(
      houseNumber: 16,
      name: "パン",
      colorTypeRawValue: 16
    )
  ]
}

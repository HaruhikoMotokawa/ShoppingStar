//
//  SalesFloorColorType.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/13.
//

import SwiftUI
/// 売り場のカラータイプを１７色で定義する
enum SalesFloorColorType: Int{
  case color1
  case color2
  case color3
  case color4
  case color5
  case color6
  case color7
  case color8
  case color9
  case color10
  case color11
  case color12
  case color13
  case color14
  case color15
  case color16
  case color17
  /// 色を返却
  var color: Color {
    switch self {
      case .color1:
        return Color(red: 0.95, green: 0.35, blue: 0.20)
      case .color2:
        return Color(red: 0.78, green: 0.00, blue: 0.22)
      case .color3:
        return Color(red: 0.53, green: 0.05, blue: 0.31)
      case .color4:
        return Color(red: 0.29, green: 0.08, blue: 0.55)
      case .color5:
        return Color(red: 0.19, green: 0.11, blue: 0.57)
      case .color6:
        return Color(red: 0.10, green: 0.14, blue: 0.49)
      case .color7:
        return Color(red: 0.05, green: 0.28, blue: 0.63)
      case .color8:
        return Color(red: 0.00, green: 0.34, blue: 0.61)
      case .color9:
        return Color(red: 0.00, green: 0.38, blue: 0.39)
      case .color10:
        return Color(red: 0.00, green: 0.30, blue: 0.25)
      case .color11:
        return Color(red: 0.11, green: 0.37, blue: 0.13)
      case .color12:
        return Color(red: 0.20, green: 0.41, blue: 0.12)
      case .color13:
        return Color(red: 0.51, green: 0.47, blue: 0.09)
      case .color14:
        return Color(red: 0.96, green: 0.50, blue: 0.09)
      case .color15:
        return Color(red: 1.00, green: 0.44, blue: 0.00)
      case .color16:
        return Color(red: 0.90, green: 0.32, blue: 0.00)
      case .color17:
        return Color(red: 0.75, green: 0.21, blue: 0.05)
    }
  }
}

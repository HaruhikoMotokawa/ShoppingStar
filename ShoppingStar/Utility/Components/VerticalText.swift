//
//  VerticalText.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/14.
//

import SwiftUI
/// 文字列を縦書きて表示するText
struct VerticalText: View {
  /// 表示する文字列
  let text: String

  var body: some View {
    VStack {
      // 受け取った文字列を一つづつVStackに入れて上から下に並べていく
      ForEach(text.map { String($0) }, id: \.self) { character in
        // 半角、全角の伸ばし棒は９０度回転させる
        if character == "-" || character == "ー" {
          Text(character)
            .rotationEffect(.degrees(90))
        } else {
          // どれ以外の文字はそのまま並べる
          Text(character)
        } // if&else
      } // ForEach
    } // VStack
  } // body
}

#Preview {
  VerticalText(text: "売り場のコーナーです！")
}

//
//  VerticalText.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/14.
//

import SwiftUI
/// 文字列を縦書きで表示するText
struct VerticalText: View {
  /// 表示する文字列
  let text: String

  var body: some View {
    VStack {
      // 受け取った文字列を一つづつVStackに入れて上から下に並べていく
      ForEach(Array(text.enumerated()), id: \.offset) { index, character in
        // 半角、全角の伸ばし棒は９０度回転させる
        if character == "-" || character == "ー" {
          Text(String(character))
            .rotationEffect(.degrees(90))
        } else {
          // それ以外の文字はそのまま並べる
          Text(String(character))
        } // if&else
      } // ForEach
    } // VStack
  } // body
}

#Preview {
  VerticalText(text: "売り場のコーナーです！")
}

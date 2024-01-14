//
//  ShoppingListView.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/08.
//

import SwiftUI

struct ShoppingListView: View {

  @Binding var screenWidth: CGFloat

  @Binding var screenHeight: CGFloat
  // MARK: - body
  var body: some View {
    ScrollView {
      LazyVStack(spacing: 15){
        ForEach(Item.dummy) { item in
          ItemCellView(
            screenWidth: $screenWidth,
            screenHeight: $screenHeight,
            item: item,
            salesFloors: SalesFloor.default
          )
        } // ForEach
      } // LazyVStack
    } // ScrollView
  } // body
}

#Preview {
  ShoppingListView(
    screenWidth: .constant(375),
    screenHeight: .constant(670)
  )
}

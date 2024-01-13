//
//  ShoppingListView.swift
//  ShoppingStar
//
//  Created by 本川晴彦 on 2024/01/08.
//

import SwiftUI

struct ShoppingListView: View {

  let screenWidth: CGFloat
  // MARK: - body
  var body: some View {
    ScrollView {
      LazyVStack(spacing: 15){
        ForEach(Item.dummy) { item in
          ItemCellView(
            screenWidth: screenWidth,
            item: item,
            salesFloors: SalesFloor.default
          )
        } // ForEach
      } // LazyVStack
    } // ScrollView
  } // body
}

#Preview {
  ShoppingListView(screenWidth: 375)
}

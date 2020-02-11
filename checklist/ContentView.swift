//
//  ContentView.swift
//  demo7
//
//  Created by yw c on 2020/01/11.
//  Copyright © 2020 yw c. All rights reserved.
//

import SwiftUI
struct MultiSelectedRow: View{
   
    var checkitems: Checkitems
    @Binding var selectedItems: Set<UUID>
    var isSelected: Bool{
        selectedItems.contains(checkitems.id)
    }
    var body: some View{
        HStack{
            Text(self.checkitems.title)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            if self.isSelected {
               Image(systemName: "checkmark").foregroundColor(Color.green)
            }
            
        }
    .onTapGesture {
            if self.isSelected{
                self.selectedItems.remove(self.checkitems.id)
            }else{
                 self.selectedItems.insert(self.checkitems.id)
            }
      }
    }
}
struct ContentView: View {
    var checkitems = Checkitems.dummyData()
   @State var selectedRows = Set<UUID>()
    
    var body: some View {
        VStack{
        NavigationView{
       List(checkitems, selection: $selectedRows){ item in
        MultiSelectedRow(checkitems: item,selectedItems: self.$selectedRows)
       }
       .navigationBarTitle(Text("NCJ最終退場チェックリスト"))
        }.navigationViewStyle(StackNavigationViewStyle())
           Button(action: {
                   
                  }) {
                    Text("確認")
                              .fontWeight(.semibold)
                              .font(.title)
                     
                      .frame(minWidth: 0, maxWidth: .infinity)
                      .padding()
                      .foregroundColor(.white)
                        .background(selectedRows.count == 12 ? Color.green : Color.gray)
                      .cornerRadius(40)
           }.disabled(selectedRows.count == 12 ? false : true)
    }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 1194, height: 834))
    }
}

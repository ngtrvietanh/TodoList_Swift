//
//  ListView.swift
//  TodoList
//
//  Created by Việt Anh on 26/11/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel
                                .updateItem(item:item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }.navigationTitle("List work 📝")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add",destination:AddView()))
    }
    
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel()) // Thêm environmentObject ở đây
}

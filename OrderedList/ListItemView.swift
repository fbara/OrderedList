//
//  ListItemView.swift
//  OrderedList
//
//  Created by Frank Bara on 11/23/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import SwiftUI

struct ListItemView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var itemName: String = ""
    
    @ObservedObject var listItem: ListItem
    
    var body: some View {
        VStack {
            TextField("Item Name", text: $itemName)
            Button(action: {
                self.listItem.name = self.itemName
                
                let order = self.listItem.order
                self.listItem.order = 0
                
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                
                self.listItem.order = order
                
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                Text("Save")
            }
        }
        .onAppear(perform: {
            self.itemName = self.listItem.name
        })
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(listItem: ListItem())
    }
}

//
//  ListItem.swift
//  OrderedList
//
//  Created by Frank Bara on 11/23/19.
//  Copyright © 2019 BaraLabs. All rights reserved.
//

import CoreData

class ListItem: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var order: Int
}

extension ListItem {
    static func getListItemFetchRequest() -> NSFetchRequest<ListItem> {
        let request = ListItem.fetchRequest() as! NSFetchRequest<ListItem>
        request.sortDescriptors = [NSSortDescriptor(key: "order", ascending: true)]
        
        return request
    }
}

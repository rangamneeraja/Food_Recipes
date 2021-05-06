//
//  Product+CoreDataProperties.swift
//  Food_Recipes
//
//  Created by Rexel_Neeraja on 06/05/21.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var id: String?

}

extension Product : Identifiable {

}

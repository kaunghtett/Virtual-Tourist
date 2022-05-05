//
//  Photo+CoreDataProperties.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 05/05/2022.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var url: URL?
    @NSManaged public var imageID: String?
    @NSManaged public var imageData: Data?
    @NSManaged public var pin: Pin?

}

extension Photo : Identifiable {

}

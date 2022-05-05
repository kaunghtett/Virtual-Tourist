//
//  Pin+CoreDataProperties.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 05/05/2022.
//
//

import Foundation
import CoreData


extension Pin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pin> {
        return NSFetchRequest<Pin>(entityName: "Pin")
    }

    @NSManaged public var country: String?
    @NSManaged public var creationDate: Date?
    @NSManaged public var latitude: Double
    @NSManaged public var locationName: String?
    @NSManaged public var longitude: Double
    @NSManaged public var pages: Int32
    @NSManaged public var photos: NSSet?

}

// MARK: Generated accessors for photos
extension Pin {

    @objc(addPhotosObject:)
    @NSManaged public func addToPhotos(_ value: Photo)

    @objc(removePhotosObject:)
    @NSManaged public func removeFromPhotos(_ value: Photo)

    @objc(addPhotos:)
    @NSManaged public func addToPhotos(_ values: NSSet)

    @objc(removePhotos:)
    @NSManaged public func removeFromPhotos(_ values: NSSet)

}

extension Pin : Identifiable {

}

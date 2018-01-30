//
//  AddEventViewControllerDelegate.swift
//  OptionDEvents
//
//  Created by Yanet Leon on 1/26/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

protocol AddEventViewControllerDelegate: class {
    func dismissButtonPressed(by controller: AddEventViewController)
    func getitemDetails(item: String, notes: String, duedate: Date, done: Bool, event: Item?, at indexPath: NSIndexPath?)
}

//
//  AddItemTableViewControllerDelegate.swift
//  BucketList
//
//  Created by Yanet Leon on 1/17/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

protocol AddItemTableViewControllerDelegate: class {
    // Requirements
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    // Transfer cancel delegate function here.
    func cancelButtonPressed(by controller: AddItemTableViewController)
}

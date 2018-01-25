//
//  AddItemViewControllerDelegate.swift
//  TodoList2
//
//  Created by Yanet Leon on 1/23/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func submitButtonPressed(by controller: AddItemViewController)
    func getitemDetails(item: String, notes: String, duedate: Date, done: Bool)
    func cancelButtonPressed(by controller: AddItemViewController)
    
}

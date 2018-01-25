//
//  ToDoListViewControllerDelegate.swift
//  TodoList
//
//  Created by Yanet Leon on 1/22/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

protocol ToDoListViewControllerDelegate: class {
    func addButtonPressed(by controller: ToDoListViewController)
}

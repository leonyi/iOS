//
//  AddItemViewControllerDelegate.swift
//  BeastLists
//
//  Created by Yanet Leon on 1/30/18.
//  Copyright © 2018 Yanet Leon. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func dismissButtonPressed(by controller: AddItemViewController)
    func getitemDetails(item: String, done: Bool, todoitem: Item?, at indexPath: IndexPath?)

}

//
//  Animal.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit


class MenuItem {
  
  let title: String
  let creator: String
  let image: UIImage?
  
  init(title: String, creator: String, image: UIImage?) {
    
    self.title = title
    self.creator = creator
    self.image = image
    
  }
  
  class func getAllMenuItems() -> Array<MenuItem> {
    
    return [ MenuItem(title: "Address", creator: "address", image: UIImage(named: "search-menu.png")),
        MenuItem(title: "XML", creator: "XML", image: UIImage(named: "search-menu.png")), MenuItem(title: "FMDB", creator: "address", image: UIImage(named: "search-menu.png"))]
   
    }
  
}
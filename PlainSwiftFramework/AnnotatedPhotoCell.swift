//
//  AnnotatedPhotoCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 26/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class AnnotatedPhotoCell: UICollectionViewCell {
  
  @IBOutlet  weak var imageView: UIImageView!
  @IBOutlet  weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
  @IBOutlet  weak var captionLabel: UILabel!
  @IBOutlet  weak var commentLabel: UILabel!
  @IBOutlet weak var roundedView :UIView!
    
  override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
    super.applyLayoutAttributes(layoutAttributes)
    if let attributes = layoutAttributes as? PinterestLayoutAttributes {
      imageViewHeightLayoutConstraint.constant = attributes.photoHeight
    }
  }
}

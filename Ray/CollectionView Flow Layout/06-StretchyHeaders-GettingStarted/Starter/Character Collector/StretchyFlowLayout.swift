//
//  StretchyFlowLayout.swift
//  Character Collector
//
//  Created by Gabriel Faria on 3/23/20.
//  Copyright © 2020 Razeware, LLC. All rights reserved.
//

import UIKit

class StretchyFlowLayout: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        let offset = collectionView!.contentOffset
        if offset.y < 0 {
            let deltaY = abs(offset.y)
            for attribute in attributes! {
                if let elementKind = attribute.representedElementKind {
                    if elementKind == "UICollectionElementKindSectionHeader" {
                        var frame = attribute.frame
                        frame.size.height = max(0, headerReferenceSize.height + deltaY)
                        frame.origin.y = frame.minY - deltaY
                        attribute.frame = frame
                    }
                }
            }
        }
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}

//
//  CarrouselFlowLayout.swift
//  Character Collector
//
//  Created by Gabriel Faria on 3/22/20.
//  Copyright © 2020 Razeware, LLC. All rights reserved.
//

import UIKit

class CarrouselFlowLayout: UICollectionViewFlowLayout {
    let defaultItemScale: CGFloat = 0.5
    let defaultItemAlpha: CGFloat = 0.5
    
    var setupMade: Bool = false
    
    override func prepare() {
        super.prepare()
        if !setupMade {
            setupMade = true
            setupCollectionView()
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        var attributesCopy = [UICollectionViewLayoutAttributes]()

        for attribute in attributes {
            let copiedAttribute = attribute.copy() as! UICollectionViewLayoutAttributes
            change(copiedAttribute)
            attributesCopy.append(copiedAttribute)
        }
        
        return attributesCopy
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let attributes = self.layoutAttributesForElements(in: collectionView!.bounds)
        
        let center = collectionView!.frame.height / 2
        let proposedContentOffsetOrigin = proposedContentOffset.y + center
        
        let closest = attributes?.sorted(by: {
            abs($0.center.y - proposedContentOffsetOrigin) < abs($1.center.y - proposedContentOffsetOrigin)
        }).first
        
        let targetContentOffset = CGPoint(x: proposedContentOffset.x, y: floor(closest!.center.x - center))
        
        return targetContentOffset
    }
    
    func change(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionViewCenter = collectionView!.frame.size.height / 2
        let offset = collectionView!.contentOffset.y
        let normalizedCenter = attributes.center.y - offset
        let maxDistance = self.itemSize.height + self.minimumLineSpacing
        let distance = min(abs(collectionViewCenter - normalizedCenter), maxDistance)
        let ratio = (maxDistance - distance) / maxDistance
        let alpha = ratio * (1 - defaultItemAlpha) + defaultItemAlpha
        let scale = ratio * (1 - defaultItemScale) + defaultItemScale
        attributes.alpha = alpha
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    }
    
    func setupCollectionView() {
        collectionView!.decelerationRate = .fast
        
        let insetY = (collectionView!.bounds.size.height - itemSize.height) / 2
        let insetX = (collectionView!.bounds.size.width - itemSize.width) / 2
        
        sectionInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
    }
}

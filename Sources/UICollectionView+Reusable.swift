//
//  UICollectionView+Reusable.swift
//  Reusable
//
//  Created by ZhangTinghui on 2017/1/24.
//  Copyright © 2017年 www.morefun.mobi. All rights reserved.
//

import UIKit

public extension UICollectionView {
    final func registerCell<T: UICollectionViewCell>(_: T.Type) where T: NibReusable {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    final func registerCellClass<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("❗️Could not dequeue cell with identifier: \(T.reuseIdentifier). "
                + "Please check if you have registered it.")
        }
        return cell
    }
    
    final func registerSupplementaryView<T: UICollectionReusableView>(_: T.Type
        , forKind kind: String) where T: NibReusable {
        register(T.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    final func registerSupplementaryViewClass<T: UICollectionReusableView>(_: T.Type
        , forKind kind: String) where T: Reusable {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueSupplementaryView<T: UICollectionReusableView>(ofKind kind: String
        , for indexPath: IndexPath) -> T where T: Reusable {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind
            , withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
                fatalError("❗️Could not dequeue supplementaryView of kind: \(kind) "
                    + "with identifier: \(T.reuseIdentifier) for indexPath \(indexPath).")
        }
        return view
    }
}

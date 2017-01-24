//
//  UITableView+Reusable.swift
//  Reusable
//
//  Created by ZhangTinghui on 2017/1/24.
//  Copyright © 2017年 www.morefun.mobi. All rights reserved.
//

import UIKit

public extension UITableView {
    final func registerCell<T: UITableViewCell>(_: T.Type) where T: NibReusable {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    final func registerCellClass<T: UITableViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueCell<T: UITableViewCell>() -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("❗️Could not dequeue cell with identifier: \(T.reuseIdentifier) . "
                + "Please check if you have registered it.")
        }
        return cell
    }
    
    final func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("❗️Could not dequeue cell with identifier: \(T.reuseIdentifier). "
                + "Please check if you have registered it.")
        }
        return cell
    }
    
    final func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: NibReusable {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    final func registerHeaderFooterClass<T: UITableViewHeaderFooterView>(_: T.Type) where T: Reusable {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    final func dequeueHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("❗️Could not dequeue header/footer with identifier: \(T.reuseIdentifier). "
                + "Please check if you have registered it.")
        }
        return view
    }
}



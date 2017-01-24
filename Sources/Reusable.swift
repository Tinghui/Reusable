//
//  Reusable.swift
//  Reusable
//
//  Created by ZhangTinghui on 2017/1/24.
//  Copyright © 2017年 www.morefun.mobi. All rights reserved.
//

import UIKit

public typealias NibReusable = Reusable & NibLoadable

// MARK: - Reusable
public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}



// MARK: - NibLoadable
public protocol NibLoadable: class {
    static var nibName: String { get }
    static var nib: UINib { get }
}

public extension NibLoadable {
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
}

public extension NibLoadable where Self: UIView {
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("❗️Could not load \(self) from first view of nib \(nibName)")
        }
        return view
    }
}



// MARK: - StoryboardLoadable
public protocol StoryboardLoadable: class {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
}

public extension StoryboardLoadable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func loadFromStoryboard() -> Self {
        let sb = UIStoryboard(name: storyboardName, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("❗️Could not load controller from \(storyboardName).storyboard with identifier: \(storyboardIdentifier)")
        }
        return vc
    }
}



//
// 
// FileName: ImageAssets.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 11/8/24 at 1:03 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

extension Image {

    /// The "dev" asset catalog image resource.
    static let warningShield = UIImage(named: "warning_shield")
    static let warningBack = UIImage(named: "warning_back")
    static let warningSuccess = UIImage(named: "warning_success")

}
/// An image resource.
struct ImageResource: Hashable {

    /// An asset catalog image resource name.
    fileprivate let name: String

    /// An asset catalog image resource bundle.
    fileprivate let bundle: Bundle

    /// Initialize an `ImageResource` with `name` and `bundle`.
    init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }

}

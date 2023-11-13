//
//  UIStackView+.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/10/14.
//

import UIKit

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}

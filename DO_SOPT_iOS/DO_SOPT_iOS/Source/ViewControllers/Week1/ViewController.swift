//
//  ViewController.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    var point1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20, height: 20)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var point2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()

    var shield: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 60, height: 20)))
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        /// add subView
        [point1, point2,shield].forEach { [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([point1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
                                     point1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                                     point1.widthAnchor.constraint(equalToConstant: 20),
                                     point1.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([point2.topAnchor.constraint(equalTo: self.point1.bottomAnchor, constant: 40),
                                     point2.leadingAnchor.constraint(equalTo: self.point1.trailingAnchor, constant: 40),
                                     point2.widthAnchor.constraint(equalToConstant: 20),
                                     point2.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([shield.topAnchor.constraint(equalTo: self.point2.bottomAnchor, constant: 40),
                                     shield.leadingAnchor.constraint(equalTo: self.point1.trailingAnchor, constant: 40),
                                     shield.widthAnchor.constraint(equalToConstant: 120),
                                     shield.heightAnchor.constraint(equalToConstant: 10)])
        
        
    }

    

}


//
//  SecondViewController.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/10/14.
//

import UIKit


class SecondViewController: UIViewController {
    // MARK: - Var
    
    var view1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20, height: 20)))
        view.backgroundColor = .yellow
        return view
    }()
    
    var view2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        view.backgroundColor = .green
        return view
    }()
    
    var view3: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        view.backgroundColor = .black
        return view
    }()
    
    var view4: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        view.backgroundColor = .blue
        return view
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        /// add subView
        [view1, view2, view3, view4].forEach { [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        /// yello View
        NSLayoutConstraint.activate([view1.topAnchor.constraint(equalTo:                                       self.view.topAnchor, constant: 0),
                                     view1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     view1.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
                                     view1.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
        /// green View
        NSLayoutConstraint.activate([view2.topAnchor.constraint(equalTo:                                       self.view1.bottomAnchor, constant: 0),
                                     view2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     view2.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
                                     view2.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
        
        /// black View
        NSLayoutConstraint.activate([view3.topAnchor.constraint(equalTo:                                       self.view2.bottomAnchor, constant: 0),
                                     view3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     view3.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
                                     view3.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
        /// blue View
        NSLayoutConstraint.activate([view4.bottomAnchor.constraint(equalTo:                                       self.view.bottomAnchor, constant: 0),
                                     view4.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     view4.widthAnchor.constraint(equalToConstant: view.bounds.width / 2),
                                     view4.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
    }

    

}


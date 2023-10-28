//
//  ThirdViewController.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/10/14.
//

import UIKit

class ThirdViewController: UIViewController {
    // MARK: - Variables
    // MARK: Constants
    private var height = UIScreen.main.bounds.height
    private var width: CGFloat = UIScreen.main.bounds.width
    
    // MARK: Property
    
    // MARK: Component
    private lazy var verti1StackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var verti2StackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    
    var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var view3: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var view4: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var views = [view1,view2,view3,view4]
    
    
    // MARK: - Function
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
        
    }
    
    // MARK: Layout Helpers
    
    private func setLayout() {
        
        [view1, view2, view3, view4, verti1StackView, verti2StackView].forEach { [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        verti1StackView.addArrangeSubViews(view1, view3)
        verti1StackView.spacing = height / 4
        verti2StackView.addArrangeSubViews(view2, view4)
        verti2StackView.spacing = height / 4
        
        [verti1StackView, verti2StackView].forEach { [weak self] view in
            guard let self else { return }
            self.view.addSubview(view)
        }
        
//
//        views.forEach { [weak self] view in
//            guard let self else { return }
//            NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
//        }
//
        NSLayoutConstraint.activate([view1.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
        NSLayoutConstraint.activate([view2.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
        NSLayoutConstraint.activate([view3.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
        NSLayoutConstraint.activate([view4.heightAnchor.constraint(equalToConstant: view.bounds.height / 4)])
       
        
        NSLayoutConstraint.activate([verti1StackView.topAnchor.constraint(equalTo:                                       self.view.topAnchor, constant: 0),
                                     verti1StackView.leadingAnchor.constraint(equalTo:   self.view.leadingAnchor, constant: 0),
                                     verti1StackView.widthAnchor.constraint(equalToConstant: width/2)]
                                    )
        
        NSLayoutConstraint.activate([verti2StackView.bottomAnchor.constraint(equalTo:                                       self.view.bottomAnchor, constant: 0),
                                     verti2StackView.trailingAnchor.constraint(equalTo:   self.view.trailingAnchor, constant: 0),
                                     verti2StackView.widthAnchor.constraint(equalToConstant: width/2)])
        
    }
    
    // MARK: Custom Function
    
    // MARK: Objc Function
    
    
}


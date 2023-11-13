//
//  PhotosViewController.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/10/28.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .black
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
        // Do any additional setup after loading the view.
    }
    
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setCollectionViewLayout() {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
            flowLayout.minimumLineSpacing = 3
            flowLayout.minimumInteritemSpacing = 3
            self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
        }
    
    
    private func setCollectionViewConfig() {
            self.collectionView.register(PhotosCollectionViewCell.self,
                                         forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }

    
}

extension PhotosViewController: UICollectionViewDelegate {}
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier,
                                                            for: indexPath) as? PhotosCollectionViewCell else {return UICollectionViewCell()}
        item.bindData(data: imageCollectionList[indexPath.row])
        return item
    }
}

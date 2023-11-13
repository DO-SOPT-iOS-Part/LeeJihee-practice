//
//  PhotosCollectionViewCell.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/10/28.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ImageCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [imageView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        likeButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    private let imageView = UIImageView()
    private lazy var likeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        $0.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .selected)
    }
    
    func bindData(data: ImageCollectionData) {
        self.imageView.image = UIImage(named: data.image)
        self.likeButton.isSelected = data.isLiked
    }
}

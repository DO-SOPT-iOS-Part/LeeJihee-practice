//
//  ObservableClass.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 12/2/23.
//

import Foundation

final class Observable<T> {
  typealias Listener = (T) -> Void
  var listener: Listener?
  
    var value: T {
    didSet {
      listener?(value)
    }
  }
    
  init(_ value: T) {
    self.value = value
  }
    
  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
    
}

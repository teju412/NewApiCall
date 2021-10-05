//
//  Observer.swift
//  NYTTImesByTeja
//
//  Created by TejaDanasvi on 5/10/21.
//

import Foundation

class Observer<T> {
    
    var value: T? {
        didSet {
            observerBlock?(value)
        }
    }
    
    init (value: T?) {
        self.value = value
    }
    
    private var observerBlock: ((T?) -> Void)?
    
    func addObserver(_ observer: @escaping (T?) -> Void) {
        self.observerBlock = observer
    }
}

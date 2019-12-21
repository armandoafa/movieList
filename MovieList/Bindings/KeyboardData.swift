//
//  KeyboardData.swift
//  MovieList
//


import SwiftUI
import Combine
import UIKit

final class KeyboardData: BindableObject {
    
    let didChange = PassthroughSubject<KeyboardData, Never>()
    
    
    var height: CGFloat? = nil {
        didSet {
            didChange.send(self)
        }
    }
    
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardData.keyboardShown(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardData.keyboardHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    deinit {
        self.height = 0

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc func keyboardShown(_ sender: Notification) {

        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let window = UIApplication.shared.keyWindow
            let bottomPadding = (window?.safeAreaInsets.bottom ?? 0) * 2
            self.height = keyboardHeight - bottomPadding
        }
        
    }
    
    @objc func keyboardHidden(_ sender: Notification) {
        self.height = 0
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
}



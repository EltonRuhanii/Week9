//
//  BetViewController+HelperFunctions.swift
//  High or Low
//
//  Created by Kin+Carta on 9.2.24.
//

import UIKit

extension BetViewController {
    
    /// Creates a styled UIView with the provided cornerRaidius, border width, border color.
    /// - Parameters:
    ///   - cornerRadius: The corner radius for the view
    ///   - borderWidth: The width of the border for the view
    ///   - borderColor: The color of the border for the view
    /// - Returns: A UIViiew instance with the specified properties.
    static func createStyledView(cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: CGColor? = nil) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor
        return view
    }
    
    /// Creates a styled UILabel with the provided text, font size, text color.
    /// - Parameters:
    ///   - text: The text of the label.
    ///   - fontSize: The font size of the Label
    ///   - textColor: The text color of the Label
    /// - Returns: A UILabel instance with the specified properties
    static func createLabel(text: String, fontSize: CGFloat, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.textColor = textColor
        return label
    }
    
    /// Creates a styled UIView with the provided details which will be used as a card
    /// - Parameter color: The background color for the view
    /// - Returns: A UIView instanve with the specified properties
    static func createCardView(color: UIColor) -> UIView {
        let view = createStyledView(cornerRadius: 10)
        view.backgroundColor = color
        return view
    }
    
    /// Creates a UILabel which will be used inside the Card View
    /// - Returns: A UILabel 
    static func createCardLabel() -> UILabel {
        let label = createLabel(text: "0", fontSize: 24, textColor: .white)
        return label
    }
    
    /// Creates a styled UIButton with the provided title and background color.
    /// - Parameters:
    ///   - title: The title text to be displayed on the button
    ///   - backgroundColor: The background color of the button
    /// - Returns: A UIButton instance with the specified properties
    static func createStyledButton(title: String, backgroundColor: UIColor ) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }
}

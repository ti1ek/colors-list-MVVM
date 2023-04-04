//
//  ColorListNewViewModel.swift
//  colors-list-MVVM
//
//  Created by Tilek Koszhanov on 02.04.2023.
//

import Foundation

protocol ViewModelType {
    var update: (() -> Void)? { get set }
    var model: [ColorInfo] { get set }
    
    func shuffleItems()
    func copyAndAddColor(by index: Int)
    func addNewRandomColor()
}

final class ColorListNewViewModel: ViewModelType {
    
    var update: (() -> Void)?
    
    var model: [ColorInfo] = [
        ColorInfo(name: "Custom Red", red: 1, green: 0, blue: 0),
        ColorInfo(name: "Custom Green", red: 0, green: 1, blue: 0),
        ColorInfo(name: "Custom Blue", red: 0, green: 0, blue: 1)
    ] {
        didSet {
            update?()
        }
    }
    
    func shuffleItems() {
        model.shuffle()
    }
    
    func copyAndAddColor(by index: Int) {
        if model.indices.contains(index) {
            model.append(model[index])
        } else {
            print("Такого индекса нет в массиве")
        }
    }
    
    func addNewRandomColor() {
        let newColor = ColorInfo(name: "Random Color",
                                 red: CGFloat.random(in: 0...1),
                                 green: CGFloat.random(in: 0...1),
                                 blue: CGFloat.random(in: 0...1))
        model.append(newColor)
    }
}

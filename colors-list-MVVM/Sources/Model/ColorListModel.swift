//
//  ColorListModel.swift
//  colors-list-MVVM
//
//  Created by Tilek Koszhanov on 02.04.2023.
//

import Foundation

struct ColorInfo {
    let name: String
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
}

struct ColorListModel {
    
    var colorList: [ColorInfo] {
        return privateColorList
    }
    
    private var privateColorList: [ColorInfo] = []
    
    init() {
        setupDefaultColors()
    }
    
    private mutating func setupDefaultColors() {
        let modelRed = ColorInfo(name: "Custom Red", red: 1, green: 0, blue: 0)
        let modelGreen = ColorInfo(name: "Custom Green", red: 0, green: 1, blue: 0)
        let modelBlue = ColorInfo(name: "Custom Blue", red: 0, green: 0, blue: 1)
        let modelYellow = ColorInfo(name: "Custom Yellow", red: 1, green: 1, blue: 0)
        
        privateColorList = [modelRed, modelGreen, modelBlue, modelYellow]
    }
    
    mutating func addColor(_ color: ColorInfo) {
        privateColorList.append(color)
    }
    
    mutating func removeColor(at index: Int) {
        privateColorList.remove(at: index)
    }
}

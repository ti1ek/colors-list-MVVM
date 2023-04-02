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
    
    // Переменная по которой можно получить список цветов из модели
    var colorList: [ColorInfo] {
        return privateColorList
    }
    
    // Приватная переменная со списком цветов
    private var privateColorList: [ColorInfo] = []
    
    init() {
        setupDefaultColors()
    }
    
    // Установка начальных значений
    private mutating func setupDefaultColors() {
        let modelRed = ColorInfo(name: "Custom Red", red: 1, green: 0, blue: 0)
        let modelGreen = ColorInfo(name: "Custom Green", red: 0, green: 1, blue: 0)
        let modelBlue = ColorInfo(name: "Custom Blue", red: 0, green: 0, blue: 1)
        let modelYellow = ColorInfo(name: "Custom Yellow", red: 1, green: 1, blue: 0)
        
        privateColorList = [modelRed, modelGreen, modelBlue, modelYellow]
    }
    
    // Добавление нового цвета
    mutating func addColor(_ color: ColorInfo) {
        privateColorList.append(color)
    }
    
    // Удаление цвета по индексу
    mutating func removeColor(at index: Int) {
        privateColorList.remove(at: index)
    }
    
    // Перемещение элементов массива
    mutating func shuffleItems() {
        privateColorList.shuffle()
    }
}

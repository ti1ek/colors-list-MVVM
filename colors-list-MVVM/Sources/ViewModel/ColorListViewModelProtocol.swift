//
//  ColorListViewModelProtocol.swift
//  colors-list-MVVM
//
//  Created by Tilek Koszhanov on 02.04.2023.
//

import Foundation

protocol ColorListViewModelProtocol {
    
    // Возвращает количество секций в таблице
    var numberOfSections: Int { get }
    
    // Возвращает количество строк в определенной секции
    var numberOfRowsInSection: (_ section: Int) -> Int { get }
    
    // Возвращает текс для кнопки с действием
    var titleForActionButton: String { get }
    
    // Возвращает текс для определенной ячейки
    var titleForRow: ((_ index: IndexPath) -> String) { get }
    
    // Возвращает параметры для установки цвета ячейки
    var backgroundColorForCell: (_ index: IndexPath) -> (red: CGFloat, green: CGFloat, blue: CGFloat) { get }
    
    // Обновляет UI
    var updateView: (() -> Void)? { get set }
    
    // Метод вызывается при нажатии на кнопку действия
    func actionButtonTapped()
    
    // Метод вызывается при нажатии на ячейку
    func cellTapped(_ index: IndexPath)
}

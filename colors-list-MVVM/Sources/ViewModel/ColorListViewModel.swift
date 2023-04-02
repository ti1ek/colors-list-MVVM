//
//  ColorListViewModel.swift
//  colors-list-MVVM
//
//  Created by Tilek Koszhanov on 02.04.2023.
//

import UIKit

final class ColorListViewModel: ColorListViewModelProtocol {
    
    var numberOfSections: Int {
        return 1
    }
    
    var titleForActionButton: String {
        return "Add new color"
    }
    
    var updateView: (() -> Void)?
    
    lazy var numberOfRowsInSection: (Int) -> Int = getNumberOfRowsInSection
    
    lazy var titleForRow: ((IndexPath) -> String) = getTitleForRow
    
    lazy var backgroundColorForCell: (IndexPath) -> (red: CGFloat, green: CGFloat, blue: CGFloat) = getBackgroundColorForCell
    
    private var model: ColorListModel = ColorListModel()

    func actionButtonTapped() {
        addNewRandomColor()
    }
    
    func cellTapped(_ index: IndexPath) {
        removeColor(at: index.row)
    }
    
    private func getNumberOfRowsInSection(_ section: Int) -> Int {
        return model.colorList.count
    }
    
    private func getTitleForRow(at indexPath: IndexPath) -> String {
        let color = model.colorList[indexPath.row]
        return color.name
    }
    
    private func getBackgroundColorForCell(at indexPath: IndexPath) -> (red: CGFloat, green: CGFloat, blue: CGFloat) {
        let color = model.colorList[indexPath.row]
        let resultColor: (red: CGFloat, green: CGFloat, blue: CGFloat) = (red: color.red, green: color.green, blue: color.blue)
        return resultColor
    }
    
    private func removeColor(at index: Int) {
        model.removeColor(at: index)
        updateView?()
    }
    
    private func addNewRandomColor() {
        let newColor = ColorInfo(name: "Random Color",
                                 red: CGFloat.random(in: 0...1),
                                 green: CGFloat.random(in: 0...1),
                                 blue: CGFloat.random(in: 0...1))
        model.addColor(newColor)
        updateView?()
    }
}

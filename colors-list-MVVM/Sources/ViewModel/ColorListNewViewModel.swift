//
//  ColorListNewViewModel.swift
//  colors-list-MVVM
//
//  Created by Zhuldyz Bukeshova on 02.04.2023.
//

import UIKit

final class ColorListNewViewModel: ColorListViewModelProtocol {
    
    var numberOfSections: Int {
        return 1
    }
    
    var titleForActionButton: String {
        return "Shuffle colors"
    }
    
    var updateView: (() -> Void)?
    
    lazy var numberOfRowsInSection: (Int) -> Int = getNumberOfRowsInSection
    
    lazy var titleForRow: ((IndexPath) -> String) = getTitleForRow
    
    lazy var backgroundColorForCell: (IndexPath) -> (red: CGFloat, green: CGFloat, blue: CGFloat) = getBackgroundColorForCell
    
    private var model: ColorListModel = ColorListModel()

    func actionButtonTapped() {
        shuffleItems()
    }
    
    func cellTapped(_ index: IndexPath) {
        copyAndAddColor(by: index.row)
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
    
    private func shuffleItems() {
        model.shuffleItems()
        updateView?()
    }
    
    private func copyAndAddColor(by index: Int) {
        let color = model.colorList[index]
        model.addColor(color)
        updateView?()
    }
}


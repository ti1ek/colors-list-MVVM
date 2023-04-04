//
//  Builder.swift
//  colors-list-MVVM
//
//  Created by Tilek Koszhanov on 04.04.2023.
//

import UIKit

class Builder {
    static func createMainModule() -> UIViewController {
        let viewModel = ColorListNewViewModel()
        let viewController = ColorsListViewController(viewModel: viewModel)
        return viewController
    }
}

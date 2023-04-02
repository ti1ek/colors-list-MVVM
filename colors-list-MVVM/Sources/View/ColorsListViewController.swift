//
//  ColorsListViewController.swift
//  colors-list-MVVM
//
//  Created by Tilek Koszhanov on 02.04.2023.
//

import UIKit

class ColorsListViewController: UIViewController {
    
    // MARK: - Outlets
    
    private let tableView = UITableView()
    private var viewModel: ColorListViewModelProtocol = ColorListNewViewModel()
    private let cellIdentifier = "MyCell"
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.updateView = {[weak self] in
            self?.tableView.reloadData()
        }
        setupTable()
    }
   
    // MARK: - Setup
    
    private func setupTable() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.frame = view.frame
    }
}

    // MARK: - UITableViewDataSource

extension ColorsListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let cellText = viewModel.titleForRow(indexPath)
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = cellText
        cell.contentConfiguration = contentConfiguration
        
        let colorRGB = viewModel.backgroundColorForCell(indexPath)
        let customColor = UIColor(red: colorRGB.red, green: colorRGB.green, blue: colorRGB.blue, alpha: 1)
        
        cell.contentView.backgroundColor = customColor
        return cell
    }
    
    @objc private func actionButtonTapped() {
        viewModel.actionButtonTapped()
    }
}

    // MARK: - UITableViewDelegate

extension ColorsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.cellTapped(indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let actionButton = UIButton()
        actionButton.setTitle(viewModel.titleForActionButton, for: .normal)
        actionButton.setTitleColor(.black, for: .normal)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return actionButton
    }
}

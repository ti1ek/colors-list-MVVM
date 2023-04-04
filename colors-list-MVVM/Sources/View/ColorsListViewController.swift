//
//  ColorsListViewController.swift
//  colors-list-MVVM
//
//  Created by Tilek Koszhanov on 02.04.2023.
//

import UIKit

class ColorsListViewController: UIViewController {
    
    private let cellIdentifier = "MyCell"
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.frame = view.frame
        return tableView
    }()
    
    var viewModel: ViewModelType
    
    // MARK: - Initialization
    
    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        
        viewModel.update = {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension ColorsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.model[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let cellText = model.name
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = cellText
        cell.contentConfiguration = contentConfiguration
        
        let customColor = UIColor(red: model.red,
                                  green: model.green,
                                  blue: model.blue,
                                  alpha: 1)
        
        cell.contentView.backgroundColor = customColor
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ColorsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.copyAndAddColor(by: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let actionButton = UIButton()
        actionButton.setTitle("Shuffle", for: .normal)
        actionButton.setTitleColor(.black, for: .normal)
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return actionButton
    }
    
    @objc private func actionButtonTapped() {
        viewModel.shuffleItems()
    }
}

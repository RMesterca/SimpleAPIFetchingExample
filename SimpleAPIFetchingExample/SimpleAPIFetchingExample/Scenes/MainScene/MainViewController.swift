//
//  ViewController.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

import UIKit

protocol MainViewControllerProtocol: class {
    func reloadScene()
    func presentAlert(with error: String)
}

class MainViewController: UIViewController, MainViewControllerProtocol {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    private (set) var viewModel: MainViewModelProtocol?

    // MARK: DI
    func set(viewModel: MainViewModelProtocol) {
        self.viewModel = viewModel
        self.viewModel?.set(viewController: self)
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        viewModel?.fetchPhotos()
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = viewModel

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }

    func reloadScene() {
        tableView.reloadData()
    }

    func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Something went wrong!", message: error, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: UITableViewDelegate
extension MainViewController: UITableViewDelegate { }

//
//  MainViewModel.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

import UIKit

protocol MainViewModelProtocol: UITableViewDataSource {
    func set(viewController: MainViewControllerProtocol?)
    func fetchPhotos()
}

class MainViewModel: NSObject, MainViewModelProtocol {

    // MARK: Properties
    weak var viewController: MainViewControllerProtocol?
    private let service = Service(client: MoyaClient<MoyaTarget>())


    // For more complex scene, it may be beneficial
    // to extract this into separate data source object
    private var data: [Photo] = []

    func set(viewController: MainViewControllerProtocol?) {
        self.viewController = viewController
    }

    enum AppError: Error {
        case generic
    }

    func fetchPhotos() {
        service.fetchPhotos { [weak self] result in
            switch result {
            case .success(let photos):
                self?.data = photos
                self?.viewController?.reloadScene()
            case .failure(let error):
                Console.log(type: .error, error.localizedDescription)
                self?.viewController?.presentAlert(with: error.localizedDescription)
            }
        }
    }
}

// MARK: Data Source
extension MainViewModel {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as? PhotoTableViewCell
            else { assertionFailure(); return UITableViewCell() }

        cell.configure(photo: data[indexPath.row])

        return cell
    }
}

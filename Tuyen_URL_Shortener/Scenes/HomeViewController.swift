//
//  ViewController.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModelProtocol = HomeViewModel()

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupViewModel()
    }
    
    @IBAction func getShortURL(_ sender: Any) {
        view.endEditing(true)
        guard let text = textField.text, text != "" else { return }
        viewModel.getShortUrl(url: text)
    }
    
    private func setupViews() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapToHideKeyboard)))
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func tapToHideKeyboard() {
        view.endEditing(true)
    }
    
    private func setupViewModel() {
        viewModel.getShortUrlSuccess = { [weak self] shortUrl in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showDefaultAlert(title: "Success", message: shortUrl)
                self.tableView.reloadData()
            }
        }
        viewModel.getShortUrlFailure = { [weak self] message in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showDefaultAlert(title: "Error", message: message)
            }
        }
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.urlModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellClass: URLShortenHistoryCell.self, for: indexPath)
        cell.setData(urlModel: Constants.urlModels[indexPath.row])
        return cell
    }
}


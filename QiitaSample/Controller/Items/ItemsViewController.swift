//
//  ItemsViewController.swift
//  QiitaSample
//
//  Created by 山本ののか on 2020/11/24.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
          tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        }
    }

    private let cellID = "UITableViewCell"
    private var qiitaItems: [QiitaItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        API.shared.getItems {[weak self] items, error in
            if let error = error {
                // TODO: エラー処理
                return
            }
            guard let items = items else {
                // TODO: エラー処理
                return
            }
            self?.qiitaItems = items
            self?.tableView.reloadData()
        }
    }
}

extension ItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = qiitaItems[indexPath.row].url,
              UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension ItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qiitaItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID) else {
            fatalError()
        }
        let item = qiitaItems[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }
}

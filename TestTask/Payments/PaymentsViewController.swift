//
//  PaymentsViewController.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import UIKit

final class PaymentsViewController: UIViewController {
    var presenter: PaymentsOutput!
    
    private var paymentsTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private var refreshControl = UIRefreshControl()
    
    //MARK: VC lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainView()
        setupNavigationVC()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupTableViewLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.didLoadView()
    }
    
    private func setupMainView() {
        view.addSubview(paymentsTableView)
    }
    
    private func setupTableView() {
        paymentsTableView.delegate = self
        paymentsTableView.dataSource = self
        paymentsTableView.register(PaymentsCell.self,
                                   forCellReuseIdentifier: PaymentsCell.identifier)
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        paymentsTableView.refreshControl = refreshControl
    }
    
    
    private func setupNavigationVC() {
        self.title = "Payments"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didLogoutTapped))
    }
    
    
    // MARK: Layout
    private func setupTableViewLayout() {
        paymentsTableView.pin
            .top()
            .left()
            .right()
            .bottom()
    }
    
    //MARK: Actions
    
    @objc
    private func didLogoutTapped(_ sender: UIBarButtonItem) {
        presenter.didLogoutButtonTap()
    }
    
    @objc
    private func refreshData(_ sender: Any) {
        presenter.didLoadView()
    }
}

extension PaymentsViewController: PaymentsInput {
    func reloadTable() {
        refreshControl.endRefreshing()
        paymentsTableView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Оk", style: .default, handler: nil))
                present(alert, animated: true)
    }
}

extension PaymentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfPayemnts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentsCell.identifier, for: indexPath) as? PaymentsCell else { return UITableViewCell() }
        
        let payment = presenter.getModel(at: indexPath)
        
        cell.configureCell(with: payment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

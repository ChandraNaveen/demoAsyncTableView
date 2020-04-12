//
//  ViewController.swift
//  NaveenAsyncTableView
//
//  Created by Naveen Chandra on 09/04/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var dataModel = [DemoModel]()
    
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
        fetchData()
        //Do any additional setup after loading the view.
    }
    
    func configureNavigationBar()
    {
        /// Setting up Activity Indicator
        let rightBarButton = UIBarButtonItem(customView: activityIndicator)
        navigationItem.setLeftBarButton(rightBarButton, animated: true)
        
        //Refresh Button
        let leftBarButton = UIBarButtonItem(title: NSLocalizedString("Refresh", comment: ""),
                                            style: .plain,
                                            target: self,
                                            action: #selector(refreshNews))
        navigationItem.setRightBarButton(leftBarButton, animated: true)
        
    }
    
    func configureTableView()
    {
        self.view = tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NaveenTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! NaveenTableViewCell
        
        
        cell.textLabel?.text = "naveen"
        cell.detailLabel.text = "NaveenNaveenNaveenNaveenNaveenNaveenNaveenNaveenNaveen,NaveenNaveenNaveenNaveenNaveenNaveenNaveenNaveenNaveen,NaveenNaveenNaveenNaveenNaveenNaveenNaveenNaveenNaveen"
        cell.contentImageView.image = UIImage(named: "")
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataModel.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    private func fetchData() {
        activityIndicator.startAnimating()
        NetworkManager.fetchData{ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let newsData):
            self.dataModel = JSONDecoder.decode(DemoModel.self)
            case .failure(let error):
                
                /// Showing alert for errors
                DispatchQueue.main.async() {
                    let alert = Alert.init(subTitle: error.localizedDescription,
                                           cancelTitle: NSLocalizedString("localiseAlertButtonOk", comment: ""))
                    alert.presentAlert(from: self)
                }
            }
            
            /// Reload tableView and dismiss activity indicator
            DispatchQueue.main.async() {
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }
        }
    }
    
    
    /// Refresh button action
    @objc private func refreshNews(_ sender: Any) {
        fetchData()
    }
    
}

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
    var dataModel:DemoModel?
    
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        activityIndicator.style = .large
        return activityIndicator
    }()
    
 override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    
    }

    
    
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
        let leftBarButton = UIBarButtonItem(title: "Refresh",
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
        tableView.register(CustomCell.self, forCellReuseIdentifier: "customCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        let data =  dataModel?.rows?[indexPath.row] as!  Asset
        
        cell.titleLabel.text = data.title
        
        cell.descriptionLabel.text = data.description
        
        cell.contentImage.loadThumbnail(urlSting: data.imageHref ?? "")
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataModel?.rows?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
      // MARK: - data functions
    
    private func fetchData() {
        self.activityIndicator.startAnimating()
        NetworkManager.fetchData{ [weak self] (result) in
            print(result)
            guard let self = self else { return }
            switch result {
            case .success(let data):
           
            self.dataModel = data
            
            case .failure(let error):
                /// Showing alert for errors
                DispatchQueue.main.async() {
                    let alert = Alert.init(subTitle: error.localizedDescription,
                                           cancelTitle:"ok")
                    alert.presentAlert(from: self)
                }
            }
            
            /// Reload tableView and dismiss activity indicator
            DispatchQueue.main.async() {
                self.activityIndicator.stopAnimating()
                //set title
                self.setTitle()
                self.tableView.reloadData()
            }
        }
    }
    
    
    func setTitle()
    {
        self.title = dataModel?.title! ?? ""
    }
    
    /// Refresh button action
    @objc private func refreshNews(_ sender: Any) {
        fetchData()
    }
    
}


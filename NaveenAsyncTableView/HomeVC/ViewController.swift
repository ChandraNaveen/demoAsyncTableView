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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view  = tableView
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        
    }
    
    
    
    
    
    
    
}


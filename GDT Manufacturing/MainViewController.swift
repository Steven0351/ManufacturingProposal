//
//  MainViewController.swift
//  GDT Manufacturing
//
//  Created by Steven Sherry on 12/25/16.
//  Copyright © 2016 Affinity for Apps. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImageView.image = UIImage(named: "gdtmfg-logo")
       
    }



}

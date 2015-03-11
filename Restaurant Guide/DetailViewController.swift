//
//  DetailViewController.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 11/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    var restaurantImage:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.restaurantImageView.image = UIImage(named: restaurantImage)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

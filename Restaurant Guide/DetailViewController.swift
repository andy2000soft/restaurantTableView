//
//  DetailViewController.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 11/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.restaurantImageView.image = UIImage(named:restaurant.image)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Nome"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Tipo"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Indirizzo"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Visitato"
            cell.valueLabel.text = (restaurant.isVisited) ? "Si, ci sono stato" : "Non ancora"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
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

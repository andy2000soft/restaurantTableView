//
//  DetailViewController.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 11/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBAction func close(segue:UIStoryboardSegue){
    }
    
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = self.restaurant.name
        self.restaurantImageView.image = UIImage(named:restaurant.image)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        // stile della tableview
        self.tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        self.tableView.separatorColor = UIColor.blackColor()
        
        // autoresizing cells
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DetailTableViewCell
        cell.backgroundColor = UIColor.clearColor()
        
        cell.mapButton.hidden = true
        
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
            cell.mapButton.hidden = false
        case 3:
            cell.fieldLabel.text = "Telefono"
            cell.valueLabel.text = restaurant.phone
        case 4:
            cell.fieldLabel.text = "Visitato"
            cell.valueLabel.text = (restaurant.isVisited) ? "Si, ci sono stato" : "Non ancora"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
       
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMap"{
        let destinationController = segue.destinationViewController as MapViewController
            destinationController.restaurant = restaurant
        }
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

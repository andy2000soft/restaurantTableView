//
//  RestaurantTableViewController.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 08/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
    Restaurant(name: "Diego", type: "Pizza al taglio", location: "Piazza Europa", image: "restaurant", isVisited: false),
    Restaurant(name: "La rondine", type: "Pizza al piatto", location: "Viale Aldo Moro", image: "imgres-1", isVisited: false),
    Restaurant(name: "Pizza & Go", type: "Da asporto", location: "Via Foggia, 34", image: "imgres-2", isVisited: false),
    Restaurant(name: "Da Mimmo", type: "pub", location: "Corso Matteotti", image: "imgres-4", isVisited: false),
    Restaurant(name: "Tiffany", type: "Bar aperitivo", location: "Viale Cappuccini", image: "imgres-5", isVisited: false)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as CustomTableViewCell
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        cell.imageThumbnail.image = UIImage(named:restaurant.image)
        cell.imageThumbnail.layer.cornerRadius = cell.imageThumbnail.frame.size.width / 2
        cell.imageThumbnail.clipsToBounds = true
        cell.preferredIconImageView.hidden = !restaurant.isVisited
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "Cosa vuoi fare", preferredStyle: .ActionSheet)
        
        // pulsante cancella
        
        let alertAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        optionMenu.addAction(alertAction)
        
        
        //Pulsante chiama
        
        let callActionHandler = {(action:UIAlertAction!)-> Void in
            let alertMessage = UIAlertController(title: "Servizio non disponibile", message: "Il servizio di chiamata non è ancora disponibile", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            alertMessage.addAction(UIAlertAction(title: "Annulla", style: .Cancel, handler: nil))
            
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call 333 4232\(indexPath.row)", style: .Default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        //pulsante condividi
        
        let shareActionHandler = {(action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Spiacenti", message: "Il servizio di condivisione non è ancora attivo", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let shareAction = UIAlertAction(title: "Condividi sui social", style: .Default, handler: shareActionHandler)
        optionMenu.addAction(shareAction)
        
        
        // sono stato qui
        let restaurant = restaurants[indexPath.row]
        let messaggioVisited = restaurant.isVisited ?  "Rimuovi dai visitati" :"Segna come già visitato"
        let sonoStatoQui = UIAlertAction(title: messaggioVisited, style: .Default, handler: {(action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath) as CustomTableViewCell
            if restaurant.isVisited{
                cell.preferredIconImageView.hidden = true
                restaurant.isVisited = false
            }else{
                cell.preferredIconImageView.hidden = false
                restaurant.isVisited = true
            }
        })
        
        optionMenu.addAction(sonoStatoQui)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // elimina cella e dati
        /* if editingStyle == .Delete{
        self.restaurantNames.removeAtIndex(indexPath.row)
        self.restaurantImages.removeAtIndex(indexPath.row)
        self.restaurantLocations.removeAtIndex(indexPath.row)
        self.restaurantTypes.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }*/
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var shareAction = UITableViewRowAction(style: .Default, title: "Condividi", handler: {(action:UITableViewRowAction!, indexPath:NSIndexPath!)->Void in
            let shareMenu = UIAlertController(title: nil, message: "Condividi su", preferredStyle: .ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Annulla", style: .Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(cancelAction)
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
            
            }
        )
        
        var deleteAction = UITableViewRowAction(style: .Default, title: "Elimina", handler:{(action:UITableViewRowAction!,indexPath: NSIndexPath!) -> Void in
            
            self.restaurants.removeAtIndex(indexPath.row)
            self.restaurants.removeAtIndex(indexPath.row)
            self.restaurants.removeAtIndex(indexPath.row)
            self.restaurants.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            }
        )
        shareAction.backgroundColor = UIColor.blueColor()
        return [shareAction,deleteAction]
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let destinationController = segue.destinationViewController as DetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
                
            }}
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
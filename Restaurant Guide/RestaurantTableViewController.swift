//
//  RestaurantTableViewController.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 08/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    
    var restaurantNames = ["Diego","la rondine","Pizza & Go", "Pizzeria da mimmo", "Tiffany","Diego","la rondine","Pizza & Go", "Pizzeria da mimmo", "Tiffany","Diego","la rondine","Pizza & Go", "Pizzeria da mimmo", "Tiffany"]
    var restaurantLocations = ["Piazza Europa","Via Aldo Moro", "corso Roma", "Piazza Padre Pio", "Viale Cappuccini","Piazza Europa","Via Aldo Moro", "corso Roma", "Piazza Padre Pio", "Viale Cappuccini","Piazza Europa","Via Aldo Moro", "corso Roma", "Piazza Padre Pio", "Viale Cappuccini"]
    var restaurantTypes = ["Pizza al Taglio", "Pizza al piatto","ristorante Cinese", "cucina tipica", "cucina etnica","Pizza al Taglio", "Pizza al piatto","ristorante Cinese", "cucina tipica", "cucina etnica","Pizza al Taglio", "Pizza al piatto","ristorante Cinese", "cucina tipica", "cucina etnica"]
    var restaurantImages = ["restaurant","imgres-1","imgres-2","imgres-4","imgres-5","restaurant","imgres-1","imgres-2","imgres-4","imgres-5","restaurant","imgres-1","imgres-2","imgres-4","imgres-5"]
    
    var isVisited = [Bool](count: 15, repeatedValue: false)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return restaurantNames.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as CustomTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.imageThumbnail.image = UIImage(named:restaurantImages[indexPath.row])
        cell.accessoryType = self.isVisited[indexPath.row] ? .Checkmark : .None
        
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
        let messaggioVisited = isVisited[indexPath.row] ?  "Rimuovi dai visitati" :"Segna come già visitato"
        let sonoStatoQui = UIAlertAction(title: messaggioVisited, style: .Default, handler: {(action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            if !self.isVisited[indexPath.row]{
            cell?.accessoryType = .Checkmark
                self.isVisited[indexPath.row] = true
            }else{
                cell?.accessoryType = .None
                self.isVisited[indexPath.row] = false
            }
            })
        
        optionMenu.addAction(sonoStatoQui)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

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

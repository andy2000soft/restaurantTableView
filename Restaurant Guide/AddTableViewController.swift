//
//  AddTableTableViewController.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 18/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var yesButton:UIButton!
    @IBOutlet weak var noButton:UIButton!
    
    @IBOutlet weak var restauranteImageView: UIImageView!
    
    
    var isVisited:Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView (tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if indexPath.row == 0{
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = true
                imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
                imagePicker.delegate = self
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        restauranteImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        restauranteImageView.contentMode = UIViewContentMode.ScaleAspectFill
        restauranteImageView.clipsToBounds = true
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    @IBAction func triggerIsVisited(sender: AnyObject?){
        let  buttonClicked = sender as UIButton
        if buttonClicked == yesButton{
            isVisited = true
            yesButton.backgroundColor = UIColor.greenColor()
            noButton.backgroundColor = UIColor.grayColor()
        }else if buttonClicked == noButton{
            isVisited = false
            noButton.backgroundColor = UIColor.redColor()
            yesButton.backgroundColor = UIColor.grayColor()
        }
    }
    
    @IBAction func save(){
        
        var errorField = ""
        
        if nameTextField.text == ""{
            errorField = "nome"
        }else if typeTextField.text == ""{
            errorField = "tipologia"
        }else if locationTextField.text == ""{
            errorField = "indirizzo"
        }else if isVisited == nil{
            errorField = "\" sei stato qui?\" "
        }
        
        
        if errorField != ""{
            let alertMessage = UIAlertController(title: "Errore", message: "Attenzione si prega di compilare il campo \(errorField)", preferredStyle: UIAlertControllerStyle.Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alertMessage, animated: true, completion: nil)
            
            return
        }
        
        println("Nome: \(nameTextField.text)")
        println("Tipologia: \(typeTextField.text)")
        println("Indirizzo: \(locationTextField.text)")
        println("Visitato:" + (!isVisited ? "No" : "Si"))
        
    }
    
}
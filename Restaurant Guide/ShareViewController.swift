//
//  shareViewController.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 16/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    @IBOutlet weak var backgroudImage: UIImageView!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var messageBUtton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    @IBAction func fbPressed(sender: AnyObject) {
        let alertView = UIAlertController(title: "Facebook", message: "Condividi su Facebook?", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: {
            (action: UIAlertAction!) -> Void in
            let sharedMessage = UIAlertController(title: "Success", message: "Ristorante condiviso con successo", preferredStyle: .Alert)
            sharedMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(sharedMessage, animated: true, completion: nil)
        }))
        self.presentViewController(alertView, animated: true, completion: nil)
        alertView.addAction(UIAlertAction(title: "Annulla", style: .Cancel, handler: nil))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sfondo sfocato
        var blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        blurView.frame = view.bounds
        self.backgroudImage.addSubview(blurView)
        
        //Bottoni animati
        
        fbButton.transform = CGAffineTransformMakeTranslation(0, 1000)
        messageBUtton.transform = CGAffineTransformMakeTranslation(0, 1000)
        emailButton.transform = CGAffineTransformMakeTranslation(0, -1000)
        twitterButton.transform = CGAffineTransformMakeTranslation(0, -1000)
    
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.fbButton.transform = CGAffineTransformMakeTranslation(0,0)
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.messageBUtton.transform = CGAffineTransformMakeTranslation(0,0)
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.emailButton.transform = CGAffineTransformMakeTranslation(0, 0)
        }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            self.twitterButton.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        
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

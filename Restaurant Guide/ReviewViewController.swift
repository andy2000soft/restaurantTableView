//
//  reviewViewController.swift
//  Restaurant Guide
//
//  Created by  Andrea Antonacci on 16/03/15.
//  Copyright (c) 2015 Andrea Antonacci. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var backgroudImageView: UIImageView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var greatButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        // aggiunge sfocatura allo sfondo (aggiunge una subview con quell'effetto)
        
        var blurView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        blurView.frame = view.bounds
        backgroudImageView.addSubview(blurView)
        
        //bottoni rotondi
        badButton.layer.cornerRadius = badButton.frame.size.width / 2
        goodButton.layer.cornerRadius = goodButton.frame.size.width / 2
        greatButton.layer.cornerRadius = greatButton.frame.size.width / 2
        
        
        // posizione iniziale della view con i pulsanti di review
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate =  CGAffineTransformMakeTranslation(0, 500)
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //
        UIView.animateWithDuration(0.7, delay: 0.0, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
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

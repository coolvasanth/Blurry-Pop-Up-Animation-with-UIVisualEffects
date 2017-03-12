//
//  ViewController.swift
//  blurbackground_onpopup
//
//  Created by Vasanth on 3/12/17.
//  Copyright © 2017 Vasanth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var additemview: UIView!
    
    
    @IBOutlet weak var visualeffectview: UIVisualEffectView!
    
    var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        effect = visualeffectview.effect
        visualeffectview.effect = nil
        additemview.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    @IBAction func addItem(_ sender: AnyObject) {
        self.view.addSubview(additemview)
        additemview.center = self.view.center
        additemview.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.additemview.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.visualeffectview.effect = self.effect
            self.additemview.alpha = 1
            self.additemview.transform = CGAffineTransform.identity
            
        })
        
    }

    
    @IBAction func dismisspopup(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.additemview.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.additemview.alpha = 0
            self.visualeffectview.effect = nil
        }) { (success:Bool) in
               self.additemview.removeFromSuperview()
        }
        
    }
    

}


//
//  ViewController.swift
//  Sandglass
//
//  Created by Artwalk on 10/29/14.
//  Copyright (c) 2014 Artwalk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator:UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collision:UICollisionBehavior!
    
    
    var ivs = [UIImageView]()
    var num:Int = 0
    
    let PARTICLE_WIDTH:CGFloat = 16
    let NUM:Int = 500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        clockFaceView.time = NSDate()
        //        for i in 1...NUM {
        //            var iv = UIImageView(image: UIImage(named: "particle"))
        //            iv.frame = CGRectMake(CGFloat(arc4random_uniform(UInt32(self.view.frame.width-PARTICLE_WIDTH))), CGFloat(arc4random_uniform(UInt32(self.view.frame.height/3))), PARTICLE_WIDTH, PARTICLE_WIDTH)
        //            ivs.append(iv)
        //            self.view.addSubview(iv)
        //        }
        
        
        animator = UIDynamicAnimator(referenceView: view)
        
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector:"test" , userInfo: nil, repeats: true)
        //        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector:"addParticle" , userInfo: nil, repeats: true)
        
    }
    
    func test() {
        var iv = UIImageView(image: UIImage(named: "particle"))
        iv.frame = CGRectMake(CGFloat((UInt32(self.view.frame.width-PARTICLE_WIDTH)/2)), 0, PARTICLE_WIDTH, PARTICLE_WIDTH)
        ivs.append(iv)
        self.view.addSubview(iv)
        
        gravity = UIGravityBehavior(items:[iv])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: ivs)
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    func addParticle() {
        
        let index = Int(arc4random_uniform(UInt32(NUM)))
        let items = [self.ivs[index]]
        
        gravity = UIGravityBehavior(items:items)
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: items)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        animator.addBehavior(collision)
        
        //        let itemBehaviour = UIDynamicItemBehavior(items: ivs)
        //        itemBehaviour.elasticity = 0.5
        //        itemBehaviour.friction = 0.5
        //        itemBehaviour.resistance = 0.5
        //        itemBehaviour.angularResistance = 0.5
        //        animator.addBehavior(itemBehaviour)
        
        self.ivs.removeLast()
        println("\(ivs.count)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


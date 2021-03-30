//
//  ViewController.swift
//  Magic-8-Ball
//
//  Created by mac on 4/3/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var askView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        let askArray = ["Akosya poculuet?", "Akosya obnimet?", "Akosya ponuhaet?", "Akosya prostit?" ]
        
        let ballArray = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball3")]
        
        imageView.image = ballArray.randomElement()
        askView.text = askArray.randomElement()
    }
    
}


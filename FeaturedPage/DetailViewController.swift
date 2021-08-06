//
//  DetailViewController.swift
//  FeaturedPage
//
//  Created by Student42 on 8/5/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var recipelbl: UILabel!
    var image = UIImage()
    var name = ""
    var recipe = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = "\(name) Recipe:"
        recipelbl.text = "You can never go wrong with some \(recipe), after all, there is a reason it's featured. You can prepare this dish following the recipe linked below!"
        img.image = image
        // Do any additional setup after loading the view.
    }
    

    

}

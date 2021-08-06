//
//  ViewController.swift
//  FeaturedPage
//
//  Created by Student42 on 7/27/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var featuredTableView: UITableView!
    
    var items = ["Pizza", "Pasta", "Tacos", "Nachos"]
    var recipe = ["classic deep-dish 'za", "creamy spaghetti", "organic vegan tacos", "colorful fiesta nachos"]

    override func viewDidLoad() {
        super.viewDidLoad()
        featuredTableView.dataSource = self
        featuredTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = items[indexPath.row]
        
        cell.textLabel?.textColor = UIColor(red: 74/100, green: 145/100, blue: 142/100, alpha: 1.0)
        
        cell.imageView?.image = UIImage(named: items[indexPath.row])
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.image = UIImage(named: items[indexPath.row])!
        vc?.name = items[indexPath.row]
        vc?.recipe = recipe[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


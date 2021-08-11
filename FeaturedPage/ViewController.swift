//
//  ViewController.swift
//  FeaturedPage
//
//  Created by Manav Aul on 7/27/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var featuredTableView: UITableView!
    
    // Array of food names that appear on the "Featured" page
    var items = ["Pizza", "Pasta", "Tacos", "Nachos"]
    
    // Array of differnt names that appear in each of the expanded descriptions when clicking on
    // a cell in the "Featured" page
    var recipe = ["classic deep-dish 'za", "creamy spaghetti", "organic vegan tacos", "colorful fiesta nachos"]

    override func viewDidLoad() {
        super.viewDidLoad()
        featuredTableView.dataSource = self
        featuredTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // This function creates all the cells in the table view of the "Featured" page

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!

        cell.textLabel?.text = items[indexPath.row]
        
        cell.textLabel?.textColor = UIColor(red: 74/100, green: 145/100, blue: 142/100, alpha: 1.0)
        
        cell.imageView?.image = UIImage(named: items[indexPath.row])
        
        return cell
    }
    // This functions allows for the expansion of the cell into a new view controller (vc), where all
    // of the information is displayed neatly.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        vc?.image = UIImage(named: items[indexPath.row])!
        vc?.name = items[indexPath.row]
        vc?.recipe = recipe[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}


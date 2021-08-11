//

//  SearchViewController.swift

//  Emmett_FoodApp

//

//  Created by Emmett Kennedy on 8/1/21.

//



import UIKit



class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {



    @IBOutlet weak var searchBar: UISearchBar!

    

    @IBOutlet weak var searchResults:

        UITableView!

    

    //Determines whether or not the user is actively searching

    var searchActive = false

    

    //All possible results from search

    var possibleResults = ["Chicken With Rice", "Chicken Parmesan", "Grilled Chicken"]

    //Results that will show based on user search

    var resultsShown: [String] = []

    

    override func viewDidLoad() {

        super.viewDidLoad()

        searchBar.delegate = self

        searchResults.delegate = self

        searchResults.dataSource = self

    }

    

    

    //These functions determine if there's an active search

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

        searchActive = true;

    }



    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {

        searchActive = false;

    }



    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

        searchActive = false;

    }



    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        searchActive = false;

    }

   

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if(searchActive){

            self.searchResults.reloadData()

        }

           resultsShown = possibleResults.filter({ (text) -> Bool in

            let tmp: NSString = text as NSString

            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)

               return range.location != NSNotFound

           })

       }

    

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{

            return resultsShown.count

    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell1 =  tableView.dequeueReusableCell(withIdentifier: "Cell")

        //Populating results of search

        cell1?.textLabel?.text = resultsShown[indexPath.row]

        cell1?.imageView?.image = UIImage(named: resultsShown[indexPath.row])



        return cell1!

    }



}



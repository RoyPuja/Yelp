//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,FiltersViewControllerDelegate {
    
    @IBOutlet weak var yelpTableView: UITableView!
    var businesses: [Business]!
    
     var searchController: UISearchController!
    var filteredData: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
       // searchController = UISearchController(searchResultsController: nil)
        //searchController.searchResultsUpdater = self as! UISearchResultsUpdating
        //searchController.dimsBackgroundDuringPresentation = false
        
       // searchController.searchBar.sizeToFit()
       // yelpTableView.tableHeaderView = searchController.searchBar
        
        // Sets this view controller as presenting view controller for the search interface
        //definesPresentationContext = true
        yelpTableView.delegate=self
        yelpTableView.dataSource = self
        yelpTableView.rowHeight=UITableViewAutomaticDimension
        yelpTableView.estimatedRowHeight=80
        //searchBar.delegate = self
        //searchBar.placeholder = "What sounds good?"
        //navigationItem.titleView = searchBar
        navigationController?.navigationBar.barTintColor = UIColor.red
        
        
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.yelpTableView.reloadData()
            
            if let businesses = businesses {
                for business in businesses {
                  //  print(business.name!)
                   // print(business.address!)
                }
            }
            
            }
        )
       
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        guard (businesses != nil) else {
            return 0
        }
        return businesses.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessCell
        cell.business = businesses[indexPath.row]
        
        return cell
        
    }

    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     //override func prepareForSegue(segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let filtersViewController = navigationController.topViewController as! FiltersViewController
        
        filtersViewController.delegate = self
        
     }
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: [String : AnyObject]) {
        print(filters)
        print(filters)
        let categories = filters["categories"] as? [String] ?? nil
        let dealsSelection = filters["deals"] as! Bool
        let distanceSelection = filters["distance"] as? Int ?? nil
        //let sortSelection = filters["sort"] as! Int
        
        Business.searchWithTerm(term: "Restaurant",sort: nil, categories: categories, deals: dealsSelection, completion: { (resultBusinesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = resultBusinesses
            self.yelpTableView.reloadData()
        })
    }
    
    
    
    
}

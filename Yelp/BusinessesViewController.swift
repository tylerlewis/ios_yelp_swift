//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FilterViewControllerDelegate {
    
    /* Outlets */
    @IBOutlet weak var businessesViewNavigationItem: UINavigationItem!
    @IBOutlet weak var businessesFilterButton: UIButton!
    @IBOutlet weak var businessesTableView: UITableView!
    
    /* Programmtic UI elements */
    var searchBar: UISearchBar!
    
    var businesses: [Business]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            if let businesses = businesses {
                for business in businesses {
                    print("\n")
                    print(business.name!)
                    print(business.address!)
                    print(business.imageURL!)
                    print(business.ratingImageURL!)
                }
            }
            
            self.businessesTableView.reloadData()
            
            }
        )
        
        self.navigationController!.navigationBar.backgroundColor = UIColor.red
        self.navigationController!.navigationBar.tintColor = UIColor.white;
        self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60)
        
        businessesFilterButton.layer.backgroundColor = UIColor.red.cgColor
        businessesFilterButton.layer.borderWidth = 1
        businessesFilterButton.layer.cornerRadius = 5
        businessesFilterButton.layer.borderColor = UIColor.white.cgColor
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Restaurants"
        businessesViewNavigationItem.titleView = searchBar
        
        businessesTableView.delegate = self
        businessesTableView.dataSource = self
        businessesTableView.estimatedRowHeight = 100
        businessesTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businesses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = businessesTableView.dequeueReusableCell(withIdentifier: "BusinessTableCell") as! BusinessTableCell
        
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        let business = businesses[indexPath.row]
        cell.business = business
        cell.initialize()
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Business.searchWithTerm(term: searchText) { (businesses, error) in
            self.businesses = businesses
            self.businessesTableView.reloadData()
        }
    }
    
    func filterViewController(filterViewController: FilterViewController, didUpdateFilters filters: [String: Any]) {
        let deals = filters["deals"] as? Bool
        let distance = filters["distance"] as? Int
        let sort = filters["sort"] as? YelpSortMode
        let categories = filters["categories"] as? [String]
        Business.searchWithTerm(term: "Restaurants", sort: sort, categories: categories, deals: deals) { (businesses, error) in
            self.businesses = businesses
            self.businessesTableView.reloadData()
        }
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filterViewController = segue.destination as! FilterViewController
        filterViewController.delegate = self
     }
    
}

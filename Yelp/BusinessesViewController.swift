//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
        self.navigationController!.navigationBar.backgroundColor = UIColor.red
        self.navigationController!.navigationBar.tintColor = UIColor.white;
        self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60)
        
        businessesFilterButton.layer.backgroundColor = UIColor.red.cgColor
        businessesFilterButton.layer.borderWidth = 1
        businessesFilterButton.layer.cornerRadius = 5
        businessesFilterButton.layer.borderColor = UIColor.white.cgColor
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

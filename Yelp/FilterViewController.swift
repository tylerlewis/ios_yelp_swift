//
//  FilterViewController.swift
//  Yelp
//
//  Created by Tyler Hackley Lewis on 4/7/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import UIKit

enum FilterRowIdentifier: String {
    case Deals = "Deals"
    case Distance = "Distance"
    case SortBy = "Sort By"
    case Category = "Category"
}

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
    FilterSwitchCellDelegate {
    
    @IBOutlet weak var filterTableView: UITableView!
    
    let HeaderViewIdentifier = "TableViewHeaderView"
    
    let filters: [Filter] = [
        Filter(header: "", options: [FilterItem(text: "Offering a deal", isOn: false)], optionDisplayIndex: 0, isDisplayingOptions: false),
        Filter(header: "Distance", options: [
            FilterItem(text: "Auto", isOn: true),
            FilterItem(text: "0.3 miles", isOn: false),
            FilterItem(text: "1 mile", isOn: false),
            FilterItem(text: "5 miles", isOn: false),
            FilterItem(text: "20 miles", isOn: false)
        ], optionDisplayIndex: 0, isDisplayingOptions: false),
        Filter(header: "Sort By", options: [
            FilterItem(text: "Best Match", isOn: true),
            FilterItem(text: "Distance", isOn: false),
            FilterItem(text: "Rating", isOn: false),
            FilterItem(text: "Most Reviewed", isOn: false)
            ], optionDisplayIndex: 0, isDisplayingOptions: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterTableView.dataSource = self
        filterTableView.delegate = self
        filterTableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HeaderViewIdentifier)
        
        filterTableView.layoutMargins = UIEdgeInsets.zero
        filterTableView.separatorInset = UIEdgeInsets.zero
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filters[section].isDisplayingOptions! {
            return filters[section].options!.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filter = filters[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableCell") as! FilterTableCell
        cell.filterRowIdentifier = filter.options[indexPath.row]
        cell.delegate = self
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        cell.layer.borderColor = UIColor.gray.cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section > 0 {
            let header = filterTableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderViewIdentifier)! as UITableViewHeaderFooterView
            header.textLabel?.text = filters[section].header
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor.white
        header.textLabel?.textColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section > 0 {
            return 40
        } else {
            return 0
        }
    }
    
    func filterSwitchCellDidToggle(cell: FilterTableCell, newValue: Bool) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

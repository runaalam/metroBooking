//
//  RouteTableViewController.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 11/9/20.
//

import UIKit

protocol RouteListViewControllerDelegate {
    func getStation(route: RouteDetails, callFor: String)
}

class RouteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
       //  MARK: - IBOutlets
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
     //  MARK: - propertirs
    
    var delegate : RouteListViewControllerDelegate?
    var filteredData: [RouteDetails] = []
    var dataList : [RouteDetails] = []
    var callFor = ""
    
    //  MARK: - UIViewController override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        getRouteNameList()
    }

    func getRouteNameList() {
        DelhiMetroClient.getRootList(completionHandler: {routeList, error in
            if !routeList!.isEmpty {
                DispatchQueue.main.async(execute: {
                    self.dataList = routeList!
                    self.filteredData = routeList!.sorted(by: { $0.routeName!.caseInsensitiveCompare($1.routeName!) == .orderedAscending })
                    self.tableView.reloadData()
                })
            }
        })
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Error Handle
    
    //show alart if not get json data from rest call
    func showAlert() {
        let alert = UIAlertController(title: "", message: "Need to run metroBookingJson project first to get json response data", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    //  MARK: - UITableViewDelegate, UITableViewDataSource,
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row].routeName
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let route = filteredData[indexPath.row]
        
        delegate?.getStation(route: route, callFor: self.callFor)
        self.dismiss(animated: true, completion: nil)
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }

    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText.isEmpty){
            filteredData = dataList
            tableView.reloadData()
        } else {
            filteredData = dataList.filter { $0.routeName!.uppercased().contains(searchBar.text!.uppercased()) }
            tableView.reloadData()
        }
    }
}

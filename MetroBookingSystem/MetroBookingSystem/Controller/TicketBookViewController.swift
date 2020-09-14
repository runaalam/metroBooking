//
//  TicketBookViewController.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 11/9/20.
//

import UIKit
import DTGradientButton

class BookingViewController: UIViewController {
    
    //  MARK: - IBOutlets
    
    @IBOutlet var fromCitySelectView: CitySelectView!
    @IBOutlet var toCitySelectView: CitySelectView!
    @IBOutlet var bookingDateButton: UIButton!
    
    var tempRoute : RouteDetails?
    var fromRoute : RouteDetails?
    var toRoute : RouteDetails?
    var bookDate : Date?
    
    //  MARK: - UIViewController override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stationSelectViewLayout()
        bookingDateButtonLayout()
    }
    
    //  MARK: - IBActions
    @IBAction func suffleButtonTapped(_ sender: Any) {
        if toRoute != nil && fromRoute != nil {
            tempRoute = fromRoute
            self.updateCityLabel(route: toRoute!, callFor: "From Station")
            self.updateCityLabel(route: tempRoute!, callFor:"To Station")
        }
    }
    
    @IBAction func fromCityTapped(_ sender: Any) {
        showCityList(callFor: "From Station")
    }
    
    @IBAction func toCityTapped(_ sender: Any) {
        showCityList(callFor: "To Station")
    }
    
    @IBAction func bookingDateTapped(_ sender: Any) {
        let calenderVC = PopupCalender()
        calenderVC.delegate = self
        calenderVC.modalPresentationStyle = .overCurrentContext
        calenderVC.modalTransitionStyle = .crossDissolve
        calenderVC.providesPresentationContextTransitionStyle = true
        calenderVC.definesPresentationContext = true
        calenderVC.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        present(calenderVC, animated: true, completion: nil)
    }
    
    
    @IBAction func comfirmBookButtonTapped(_ sender: Any) {
        if fromRoute != nil && toRoute != nil && bookDate != nil {
        let fare = TicketFare.calculate(fromRoute: fromRoute!, toRoute: toRoute!)
            let ticketDetails = TicketDetails(fromRouteName: fromRoute!.routeName!, toRouteName: fromRoute!.routeName!, bookingDate:  self.bookDate!, ticketFare: fare)
            print(ticketDetails)
        }
    }
    
    //  MARK: - Layout Settings
    
    func stationSelectViewLayout() {
        fromCitySelectView.setColor(color: "Gray")
        toCitySelectView.setColor(color: "Gray")
    }
    
    func bookingDateButtonLayout() {
        bookingDateButton.setCustom(title: "Select Date", tinColor: UIColor.black)
        bookingDateButton.titleEdgeInsets.left = 30
    }
    
    func showCityList(callFor: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Route_List") as! RouteListViewController
        vc.delegate = self
        vc.callFor = callFor
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .fullScreen
        navController.navigationBar.topItem?.title = callFor
        self.present(navController, animated: true, completion: nil)
        
    }
    
    func updateCityLabel(route: RouteDetails, callFor : String) {
        
        if callFor == "From Station" {
            fromRoute = route
            fromCitySelectView.headLabel.text = fromRoute?.routeName
            if fromRoute!.routeType!.count == 1 {
                fromCitySelectView.setColor(color: (fromRoute?.routeType?.first)!)
            } else {
                fromCitySelectView.setColor(color: "Gray")
            }
            
        } else if callFor == "To Station"{
            toRoute = route
            toCitySelectView.headLabel.text = toRoute?.routeName
            if toRoute!.routeType!.count == 1 {
                toCitySelectView.setColor(color: (toRoute?.routeType?.first)!)
            } else {
                toCitySelectView.setColor(color: "Gray")
            }
        }
    }
    
    // MARK: - Error Handle
    
    func showAlert() {
        
    }
}

//  MARK: - Delegate

extension BookingViewController: PopupCalenderDelegate {
    func saveDate(dateString: String) {
        bookingDateButton.setTitle(dateString, for: .normal)
        let formatter = DateFormatter()
        bookDate = formatter.getDate(strDate: dateString)
    }
}

extension BookingViewController : RouteListViewControllerDelegate {
    func getStation(route: RouteDetails, callFor: String) {
        tempRoute = route as RouteDetails
        self.updateCityLabel(route: tempRoute!, callFor: callFor)
    }
}




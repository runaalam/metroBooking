//
//  BookedTicketViewController.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 14/9/20.
//

import UIKit

class BookedTicketViewController: UIViewController {

    var ticketDetails : TicketDetails?
    
     //  MARK: - IBOutlets
    
    @IBOutlet var bookeCardView: BookingCardView!
    @IBOutlet var navBarItem: UINavigationItem!
    @IBOutlet var toolBar: UIToolbar!
    
  
    //  MARK: - UIViewController override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setBookCard()
    }
        
    //  MARK: - IBActions
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        //generate ticket details Iamge
        let ticketImage = generateTicketImage()
      
        // set up activity view controller
        let imageToShare = [ ticketImage ]
        
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //set ticket booking card so that get all details togather and take an image to share
    func setBookCard(){
        if ticketDetails != nil {
            let formatter = DateFormatter()
            let dateStr = formatter.getString(date: (ticketDetails?.bookingDate)!)
            let fare : Double = (ticketDetails?.ticketFare!)!
            bookeCardView.dateLabel.text = dateStr
            bookeCardView.fromRouteNameLabel.text = ticketDetails?.fromRouteName
            bookeCardView.toRouteNameLabel.text = ticketDetails?.toRouteName
            bookeCardView.ticketFareLabel.text = String(format: "%.1f", fare) + " INR"
        }
    }
    
    /// Returns a UIImage object generated from the current view
    func generateTicketImage() -> UIImage {

        // Hide NavigationBar and Toolbar to take book card image
        toggleExtraViews(hide: true)
       
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let ticketImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // Show toolbar and navbar
        toggleExtraViews(hide: false)
        
        return ticketImage
    }
    
    private func toggleExtraViews(hide: Bool) {
        self.navigationController?.navigationBar.isHidden = hide
        toolBar.isHidden = hide
    }
}

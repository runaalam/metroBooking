//
//  CalenderViewController.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 9/9/20.
//

import UIKit
import MDatePickerView

protocol CalenderViewControllerDelegate {
    func saveDate(dateString : String)
}

class PopupCalender: UIViewController {
    
    let formatter = DateFormatter()
    var delegate : CalenderViewControllerDelegate?
    var dateString = ""
    
    lazy var Calender : MDatePickerView = {
        let mdate = MDatePickerView()
        mdate.delegate = self
        mdate.Color = UIColor(red: 0/255, green: 178/255, blue: 113/255, alpha: 1)
        mdate.cornerRadius = 14
        mdate.translatesAutoresizingMaskIntoConstraints = false
        mdate.from = 1920
        mdate.to = 2050
        return mdate
    }()

    lazy var SelectButton : UIButton = {
        let button = UIButton(type:.system)
        button.setCustom(title: "Today")
        button.addTarget(self, action: #selector(selectDate), for: .touchUpInside)
        return button
    }()

    @objc func selectDate() {
        if dateString.isEmpty {
            dateString = formatter.getString(date: Date())
        }
        delegate?.saveDate(dateString: dateString)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCalender()
        addButton()
    }
    
    func addCalender() {
        view.addSubview(Calender)
        NSLayoutConstraint.activate([
            Calender.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            Calender.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            Calender.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            Calender.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
    }
    
    func addButton() {
        view.addSubview(SelectButton)
        SelectButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        SelectButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        SelectButton.topAnchor.constraint(equalTo: Calender.bottomAnchor, constant: 40).isActive = true
        SelectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
}

extension PopupCalender : MDatePickerViewDelegate {
    
    func mdatePickerView(selectDate: Date) {
        dateString = formatter.getString(date: selectDate)
        SelectButton.setTitle(dateString, for: .normal)
    }
}

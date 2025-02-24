//
//  TodayViewController.swift
//  Project3
//
//  Created by Siddharth Ansh on 18/02/25.
//

import UIKit

class TodayViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var incidentsView: UIView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var sideViewLeadingConstraint: NSLayoutConstraint!
    
    @IBAction func tapProfileButton(_ sender: Any) {
        let sidebarVC = SidebarViewController()
        sidebarVC.modalPresentationStyle = .overFullScreen
        present(sidebarVC, animated: false) {
            sidebarVC.toggleSidebar(show: true)
        }
    }
    
    @IBAction func disableTodayButton(_ sender: Any) {
        table.isHidden = false
        incidentsView.isHidden = true
    }
    
    @IBAction func tapIncidentsButton(_ sender: Any) {
        table.isHidden = true
        incidentsView.isHidden = false
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        
//        if let touchPoint = touches.first?.location(in: self.view) {
//        if !self.profileView.frame.contains(touchPoint) {
//            UIView.animate(withDuration: 0.3) {
//                self.sideViewLeadingConstraint.constant = -(self.view.frame.width * 0.8)
//                self.view.layoutIfNeeded()
//            }
//        }
//       }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sideViewLeadingConstraint: \(String(describing: sideViewLeadingConstraint))")
        
        
        let nib = UINib(nibName: "LoadingPageVCTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "LoadingPageVCTableViewCell")
        
        let nib1 = UINib(nibName: "IncidentsTableViewCellVC", bundle: nil)
        table.register(nib1, forCellReuseIdentifier: "IncidentsTableViewCellVC")
        table.delegate = self
        table.dataSource = self
        
        let nib3 = UINib(nibName: "TaskTableViewCellVC", bundle: nil)
        table.register(nib3, forCellReuseIdentifier: "TaskTableViewCellVC")
        
        let nib4 = UINib(nibName: "WorkingTodayTableViewCellVC", bundle: nil)
        table.register(nib4, forCellReuseIdentifier: "WorkingTodayTableViewCellVC")
        
        table.dataSource = self
        table.delegate = self
        incidentsView.isHidden = true
        
        UIView.animate(withDuration: 0.5) {
            
        }
        
    }
}

extension TodayViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 // endIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let test = tableView.dequeueReusableCell(withIdentifier: "LoadingPageVCTableViewCell", for: indexPath) as? LoadingPageVCTableViewCell else {
                print("The dequeued cell is not of type LoadingPageVCTableViewCell.")
                return UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
            }
            return test
        case 1:
            guard let test1 = tableView.dequeueReusableCell(withIdentifier: "IncidentsTableViewCellVC", for: indexPath) as? IncidentsTableViewCellVC else {
                print("The dequeued cell is not of type IncidentsTableViewCellVC.")
                return UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
            }
            return test1
        case 2:
            guard let test2 = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCellVC", for: indexPath) as? TaskTableViewCellVC else {
                print("The dequeued cell is not of type TaskTableViewCellVC.")
                return UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
            }
            return test2
        case 3:
            guard let test3 = tableView.dequeueReusableCell(withIdentifier: "WorkingTodayTableViewCellVC", for: indexPath) as? WorkingTodayTableViewCellVC else {
                print("The dequeued cell is not of type IncidentsTableViewCellVC.")
                return UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
            }
            return test3
        default:
            break
        }
        return UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
    }

}

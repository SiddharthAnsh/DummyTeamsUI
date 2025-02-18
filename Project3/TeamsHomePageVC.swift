//
//  TeamsHomePageVC.swift
//  Project3
//
//  Created by Siddharth Ansh on 18/02/25.
//

import UIKit

class TeamsHomePageVC: UIViewController {

    @IBAction func moveToContoso(_ sender: UIButton) {
        performSegue(withIdentifier: "TeamToContoso", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

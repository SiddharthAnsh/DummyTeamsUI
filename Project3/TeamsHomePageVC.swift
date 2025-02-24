//
//  TeamsHomePageVC.swift
//  Project3
//
//  Created by Siddharth Ansh on 18/02/25.
//

import UIKit

class TeamsHomePageVC: UIViewController {

    
    @IBAction func tapToContoso(_ sender: Any) {
        guard let screenName = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "LoadingPageVC") as? LoadingPageVC
        else {
            print("Could not instantiate WelcomeToContosoVC")
            return
        }
                
        if let navController = self.navigationController {
            navController.pushViewController(screenName, animated: true)
        } else {
            screenName.modalPresentationStyle = .fullScreen
            present(screenName, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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

//
//  MenuViewController.swift
//  Clima
//
//  Created by Caio on 31/12/22.
//

import UIKit
import Foundation

class MenuViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var backgroundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        self.backgroundLabel.layer.masksToBounds = true
        self.backgroundLabel.layer.cornerRadius = 30
        
            }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "citysegue"{
            
            if let viewDestino = segue.destination as? ViewController{
                
                viewDestino.city = cityTextField.text
                
                
            }
        }
        
        
    }
}

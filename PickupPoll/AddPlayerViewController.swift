//
//  AddPlayerViewController.swift
//  PickupPoll
//
//  Created by Apurv Suman on 12/23/16.
//  Copyright © 2016 Apurv Suman. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    var player: Player?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name = nameTextField.text ?? ""
        player = Player(name: name, playing: false)
    }
    

}

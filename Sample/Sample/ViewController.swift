//
//  ViewController.swift
//  Sample
//
//  Created by Abdullah Selek on 05/05/2019.
//  Copyright © 2019 VerifID. All rights reserved.
//

import UIKit
import vl_ios

class ViewController: UIViewController {

    let apiClient = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User(country: "country",
                        dateOfBirth: "10.04.1980",
                        gender: "male",
                        name: "name",
                        placeOfBirth: "city",
                        surname: "surname")
        apiClient.sendUser(user) { userResponse, error in
            
        }
    }


}


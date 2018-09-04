//
//  ViewController.swift
//  SQLiteApp
//
//  Created by Jamie on 2018-09-04.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            let db = try Database()
            let people = try db.getAllFamousPeople()
            for person in people {
                print(person.firstName)
            }
        } catch let error {
            print("Error \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


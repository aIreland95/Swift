//
//  ViewController.swift
//  Sensing
//
//  Created by Aaron on 1/9/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

typealias Personified = Sensing & Nameable & Audible

class SensingViewController: UIViewController {
    
    //new from Monday!
    @IBOutlet private var tableView: UITableView!
    //new from Monday!
    
    private var sensings = [Personified]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let person = Person.init(firstName: "Donnie", lastName: "Dude", pet: nil)
        sensings.append(person)
        
        let weasel = Weasel.init(firstName: "Pop", lastName: "Goes")
        sensings.append(weasel)
        
        let parrot = Parrot.init(firstName: "Polly", lastName: "Bird")
        sensings.append(parrot)
        
        let sam = Person.init(firstName: "Sam", lastName: "Gamgee", pet: weasel)
        sensings.append(sam)
        
        let froto = Person.init(firstName: "Froto", lastName: "Baggins", pet: parrot)
        sensings.append(froto)
        
        for sensing in sensings {
            
            print(sensing.fullName)
            print(sensing.speak())
            print(sensing.hear())
            
            if let person = sensing as? Person {
                person.pet?.poop()
                person.pet?.sit()
                person.pet?.sleep()
            }
        }
    }


}

// MARK:- UITableViewDataSource methods

extension SensingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sensings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personifiedCell", for: indexPath) as! PersonifiedTableViewCell
        
        let personified = sensings[indexPath.row]
        cell.nameLabel.text = personified.fullName
        cell.hearLabel.text = personified.hear()
        cell.seeLabel.text = personified.see()
        
        return cell
    }
}

// MARK:- UITableViewDelegate methods

extension SensingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let personified = sensings[indexPath.row]
        
        if let person = personified as? Person, person.pet != nil {
            
            return 145
        }
        
        return 75
    }
}

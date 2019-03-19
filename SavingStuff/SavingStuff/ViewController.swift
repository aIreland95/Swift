//
//  ViewController.swift
//  SavingStuff
//
//  Created by Aaron on 2/25/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var fullName: UITextField!
    @IBOutlet private var address: UITextField!
    @IBOutlet private var state: UITextField!
    @IBOutlet private var zipCode: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullAddress: Address? = UserDefaults.standard.codable(forKey: "fullAddress")
        
        let userFullName = fullAddress?.name
        fullName.text = userFullName
        
        let userAddress = fullAddress?.address
        address.text = userAddress
        
        let userState = fullAddress?.state
        state.text = userState
        
        let userZip = fullAddress?.zipCode
        zipCode.text = userZip
    }

    @IBAction private func savePressed(_ sender: Any) {
        
        let userFullName = fullName.text ?? ""
        let userAddress = address.text ?? ""
        let userState = state.text ?? ""
        let userZip = zipCode.text ?? ""
        
        let fullAddress = Address(name: userFullName, address: userAddress, state: userState, zipCode: userZip)
        UserDefaults.standard.saveCodable(fullAddress, forKey: "fullAddress")
    }
}

extension UserDefaults {
    
    func saveCodable<T: Codable>(_ value: T, forKey key: String) {
        
        let jsonEncoder = JSONEncoder()
        guard let json = try? jsonEncoder.encode(value) else { return }
        UserDefaults.standard.set(json, forKey: key)
    }
    
    func codable<T: Codable>(forKey key: String) -> T? {
        
        guard let json = UserDefaults.standard.value(forKey: key) as? Data else { return nil }
        let value = try? JSONDecoder().decode(T.self, from: json)
        return value
    }
}

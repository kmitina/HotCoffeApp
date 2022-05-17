//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by DVKSH on 16.05.22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
       guard let coffeeOrdersURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<[Order]>(url: coffeeOrdersURL)
        
        WebService().load(resource: resource) { result in
            
            switch result {
            case .success(let orders):
                print(orders)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}

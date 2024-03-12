//
//  TyreListViewController.swift
//  FuelAndServices
//
//  Created by faten aldosari on 12/03/2024.
//

import UIKit
import Eureka

class TyreListViewController: FormViewController {
    
    let tyreData: [TyreCellModel] = [
           TyreCellModel(tyreType: "Standard", price: 150.00),
           TyreCellModel(tyreType: "Premium", price: 200.00),
           TyreCellModel(tyreType: "Performance", price: 250.00),
       ]

       override func viewDidLoad() {
           super.viewDidLoad()
           setupForm()
           self.tableView.backgroundColor = .white
       }

       private func setupForm() {
           form +++ Section("Tyre List")

           for tyre in tyreData {
               form.last!
                   <<< LabelRow {
                       $0.title = tyre.tyreType
                       $0.value = String(format: "KWD %.2f", tyre.price)
                       $0.cell.imageView?.image = UIImage(named: "tyre") 
                   }
           }
       }
   }

   struct TyreCellModel {
       var tyreType: String
       var price: Double

       init(tyreType: String, price: Double) {
           self.tyreType = tyreType
           self.price = price
       }
   }



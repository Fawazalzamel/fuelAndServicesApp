//
//  HistoryViewController.swift
//  FuelAndServices
//
//  Created by fatma adnan on 12/03/2024.
//

import UIKit
import SnapKit

class HistoryTableViewController: UITableViewController {
    
    var history: [History] = [History(serviceType: "", date: " 12/3/24 - 8:00pm ", typeImage: "tyre")]

   
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")

        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Reusable cell:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
   
        let historyCell = history[indexPath.row]
        
        
       //Configure
        cell.textLabel?.text = " \(historyCell.serviceType) \(historyCell.date) \(historyCell.typeImage)"

        cell.imageView?.image = UIImage(named: historyCell.typeImage)
        
        //return
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailVC = DetailViewController()
        
        let historyType = history[indexPath.row]
        DetailVC.historyDetails = historyType
        navigationController?.pushViewController(DetailVC, animated: true)
        
  }


}

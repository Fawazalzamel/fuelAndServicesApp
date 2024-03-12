//
//  RequestPageViewController.swift
//  FuelAndServices
//
//  Created by Fawaz Alzamel on 12/03/2024.
//

import UIKit
import SnapKit
import Eureka

class RequestPageViewController: FormViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        setupForm()

        
        title = "Request Page"
    }
    
    private func setupForm() {
        form +++ Section("Request Form")
        <<< ActionSheetRow<String>() { row in
            row.title = "Request Type"
            row.options = ["Fuel", "Tires", "Major or Minor Service"]
            row.value = "Request Type"
            row.tag = "requestType"
                
                
        }
    
        
        <<< TextRow() { row in
            row.title = "Car Type"
            row.placeholder = "Enter Car Type"
            row.tag = "carType"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
        }
        
        
        <<< ActionSheetRow<String>() { row in
            row.title = "Fuel Type"
            row.options = ["98 Fuel", "95 Fuel", "91 Fuel", "Diesel"]
            row.value = "Fuel Type (Optional)"
            row.tag = "fuelType"
        }
        
        
        <<< ActionSheetRow<String> { row in
            row.title = "Service Type"
            row.options = ["Major Service", "Minor Service"]
            row.value = "Service Type (Optional)"
            row.tag = "serviceType"
                    }
        
        <<< TextRow() { row in
            row.title = "Location"
            row.placeholder = "Enter location"
            row.tag = "location"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
        }
    
        form +++ Section()
        form +++ Section()
        
        <<< ButtonRow() { row in
            row.title = "Submit Request"
        }.onCellSelection { _, _ in
            self.submitTapped()
        }
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(submitTapped))
    }
    
    @objc func submitTapped() {
           
        
        let errors = form.validate()
                guard errors.isEmpty else {
                    presentAlertWithTitle(title: "🚨", message: "\(errors.count) fields are missing")
                    return
                }
        
                let requestTypeRow: TextRow? = form.rowBy(tag: "requestType")
        
                let carTypeRow: TextRow? = form.rowBy(tag: "carType")
                let fuelTypeRow: TextRow? = form.rowBy(tag: "fuelType")
                let serviceTypeRow: TextRow? = form.rowBy(tag: "serviceType")
        
                let locationRow: TextRow? = form.rowBy(tag: "location")
        
        
                let requestType = requestTypeRow?.value ?? ""
        
                let carType = carTypeRow?.value ?? ""
        
                let fuelType = fuelTypeRow?.value ?? ""
        
                let serviceType = serviceTypeRow?.value ?? ""
        
                let location = locationRow?.value ?? ""
                    
//                let pet = Pet(id: nil, name: name, adopted: true, image: imageUrl, age: age, gender: gender)
//                    print(pet)
//              // Call addBook to add the book, backend will handle assigning an ID
//              NetworkManager.shared.addPet(pet: pet) { success in
//                  DispatchQueue.main.async {
//                      if success {
//                          // Dismiss the form upon successful submission
//                          self.dismiss(animated: true, completion: nil)
//                      } else {
//                          // Handle submission error, e.g., show an error alert
//                      }
//                  }
//              }
          }
    
    private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
}





#if canImport(SwiftUI) && DEBUG
struct RequestPageViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable(RequestPageViewController())
    }
}
#endif




#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: ViewController
    
    init(_ builder: @autoclosure @escaping () -> ViewController) {
        self.viewController = builder()
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}
#endif

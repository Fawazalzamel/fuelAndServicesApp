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

    var token: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        setupForm()

        
        title = "Request Page"
        token = UserDefaults.standard.string(forKey: "token")
    }
    
    private func setupForm() {
        form +++ Section("Request Form")
        
    
        
        <<< ActionSheetRow<CarType>() { row in
            row.title = "Car Type"
            row.options = [CarType.saloon,CarType.suv,CarType.truck]
            row.noValueDisplayText = "Car Type"
            row.tag = "carType"
            
        }
        
        
        <<< ActionSheetRow<FuelType>() { row in
            row.title = "Fuel Type"
            row.options = [FuelType.regular,FuelType.preimum,FuelType.disel]
            row.noValueDisplayText = "Fuel Type (Optional)"
            row.tag = "fuelType"
        }
        
        
        <<< ActionSheetRow<ServiceType> { row in
            row.title = "Service Type"
            row.options = [ServiceType.major,ServiceType.minor, ServiceType.tires,ServiceType.fuel]
            row.noValueDisplayText = "Service Type (Optional)"
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
        
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(submitTapped))
    }
    
    @objc func submitTapped() {
           
        
        let errors = form.validate()
                guard errors.isEmpty else {
                    presentAlertWithTitle(title: "🚨", message: "\(errors.count) fields are missing")
                    return
                }
        
               
        
                let carTypeRow: ActionSheetRow<CarType>? = form.rowBy(tag: "carType")
                let fuelTypeRow: ActionSheetRow<FuelType>? = form.rowBy(tag: "fuelType")
                let serviceTypeRow: ActionSheetRow<ServiceType>? = form.rowBy(tag: "serviceType")
                let locationRow: TextRow? = form.rowBy(tag: "location")
        
        
      
        
                let carType = carTypeRow?.value
       
                let fuelType = fuelTypeRow?.value
        
                let serviceType = serviceTypeRow?.value
        
                let location = locationRow?.value ?? ""
        

        var service_Id: Int?
        let request = RequestModel(request_Id: nil, location: location, carType: carType, fuelType: fuelType)
        print(request)
        switch serviceType ?? ServiceType.fuel{
        case ServiceType.fuel:
            service_Id = 1
        case ServiceType.major:
            service_Id = 2
        case ServiceType.minor:
            service_Id = 3
        case ServiceType.tires:
            service_Id = 4
        }
        print(token ?? "no token")
        NetworkManger.shared.addRequest(token: token ?? "", request: request, service_Id: service_Id ?? 0) { success in
                    DispatchQueue.main.async {
                                    if success {
                                              self.dismiss(animated: true, completion: nil)
                                } else {

                            }
                        }
                }
        
        alertWithTitle(title: "Request Successful", message: "")
        
        
          }
    
    private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
    
    private func alertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { UIAlertAction in
            let HomeVC = MainTabBarController()
            HomeVC.modalPresentationStyle = .fullScreen
                self.present(HomeVC,animated: true, completion: nil)
        }))
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

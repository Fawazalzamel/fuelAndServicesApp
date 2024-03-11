//
//  SignUpViewContoller.swift
//  FuelAndServices
//
//  Created by Fawaz Alzamel on 11/03/2024.
//

import UIKit
import Eureka
import Alamofire
import Foundation
import SnapKit

class SignUpViewController : FormViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "SignUp Page"
        
        setupForm()
    }
    
    private func setupForm() {
        form +++ Section("SignUp Form")
        <<< TextRow() { row in
            row.title = "Username"
            row.placeholder = "Enter Username"
            row.tag = "Username"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
            
        }
        
        <<< TextRow() { row in
            row.title = "Password"
            row.placeholder = "Enter Password"
            row.tag = "Password"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
            
        }
        
        <<< TextRow() { row in
            row.title = "Email"
            row.placeholder = "Enter Email"
            row.tag = "Email"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
            
        }
        
        <<< TextRow() { row in
            row.title = "Name"
            row.placeholder = "Enter Name"
            row.tag = "Name"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
            
        }
        
        <<< IntRow() { row in
            row.title = "Phone Number"
            row.placeholder = "Enter Phone Number"
            row.tag = "PhoneNumber"
            row.add(rule: RuleRequired())
            row.validationOptions = .validatesOnChange
            row.cellUpdate { cell, row in
                if !row.isValid{
                    cell.titleLabel?.textColor = .red
                }
            }
            
            
            <<< ButtonRow() { row in
                row.title = "Submit"
            }.onCellSelection { _, _ in
                self.submitTapped()
            }
        }
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(submitTapped))
            
        }
        @objc func submitTapped() {
            
            
            let errors = form.validate()
            guard errors.isEmpty else {
                presentAlertWithTitle(title: "🚨", message: "\(errors.count) fields are missing")
                return
            }
            
            let usernameRow : TextRow? = form.rowBy(tag: "Username")
            let passwordRow :TextRow? = form.rowBy(tag: "Password")
            let emailRow :TextRow? = form.rowBy(tag: "Email")
            let nameRow :TextRow? = form.rowBy(tag: "Name")
            let phoneNumberRow :IntRow? = form.rowBy(tag: "PhoneNumber")
            
            let username = usernameRow?.value ?? ""
            let password = passwordRow?.value ?? ""
            let email = emailRow?.value ?? ""
            let name = nameRow?.value ?? ""
            let phoneNumber = phoneNumberRow?.value
            
            
            //               let user = User(username: username, email: email, password: password)
            //                   print(user)
            
            //        NetworkManager.shared.signup(user: user ){ success in
            //
            //            DispatchQueue.main.async {
            //
            //                switch success{
            //                case .success(let tokenResponse):
            //                    print(tokenResponse.token)
            //                case .failure(let error):
            //                    print(error)
            //                }
            //                }
            //            }
        }
        
        private func presentAlertWithTitle(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true, completion: nil)
        }
        
    }


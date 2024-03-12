//
//  SignUpViewController.swift
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
        
        <<< PasswordRow() { row in
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
        
        <<< EmailRow() { row in
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
        
        <<< PhoneRow() { row in
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
            
        }
        
        <<< ButtonRow() { row in
            row.title = "Submit"
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
        
        let usernameRow : TextRow? = form.rowBy(tag: "Username")
        let passwordRow :TextRow? = form.rowBy(tag: "Password")
        let emailRow :EmailRow? = form.rowBy(tag: "Email")
        let phoneNumberRow :PhoneRow? = form.rowBy(tag: "PhoneNumber")
        
        let username = usernameRow?.value ?? ""
        let password = passwordRow?.value ?? ""
        let email = emailRow?.value ?? ""
        let phoneNumber = phoneNumberRow?.value
        
        //               let user = User(username: username, email: email, password: password)
        //                   print(user)
        //
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



#if canImport(SwiftUI) && DEBUG
struct SignUpViewControllerPreview: PreviewProvider {
    static var previews: some View {
        GenericViewControllerRepresentable(SignUpViewController())
    }
}
#endif




#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct enericViewControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {
    
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

//
//  ProfileViewController.swift
//  FuelAndServices
//
//  Created by fatma adnan on 11/03/2024.
//

import UIKit
import Alamofire
import SnapKit
import Kingfisher

class ProfileViewController: UIViewController {

    var profile: Profile?
    
   
    
    private let usernameLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let imageView = UIImageView()
    private let emailLabel = UILabel()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title: "Profile"
        
        view.addSubview(usernameLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(imageView)
        view.addSubview(emailLabel)
        
        imageView.image = UIImage(named: "profile")
        
        usernameLabel.text = "   Username: Fatma123 "
        emailLabel.text = "  Email: Fatma@gmail.com  "
        phoneNumberLabel.text = "  Phone Number: 00965 "
        
        
        // Do any additional setup after loading the view.
        setupUI()
        setupLayout()
        
    }
    
    func  setupUI(){
        view.backgroundColor = .white
        
//        usernameLabel.layer.borderWidth = 0.5
        usernameLabel.font = .systemFont(ofSize: 19, weight: .bold)
//        
//        phoneNumberLabel.layer.borderWidth = 0.5
        phoneNumberLabel.font = .systemFont(ofSize: 19, weight: .bold)
//         
//        emailLabel.layer.borderWidth = 0.5
        emailLabel.font = .systemFont(ofSize: 19, weight: .bold)
        
        //image-Border:
        imageView.layer.borderWidth = 2.0
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
    }
    
    
    func  setupLayout(){
        
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
           // make.leading.equalToSuperview().offset(20)
            //make.width.height.equalTo(75)
            make.centerX.equalToSuperview()
        }
        imageView.layer.cornerRadius = 300
        imageView.clipsToBounds = true
        
        usernameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.bottom.equalTo(usernameLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()

        }
        
        emailLabel.snp.makeConstraints { make in
            make.bottom.equalTo(phoneNumberLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()

        }
        
        
        
        
        
        
    }
      
}







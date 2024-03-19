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
//    let signOutButton = UIButton(type: .system)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = " My Profile"
        
        
        view.addSubview(usernameLabel)
        view.addSubview(phoneNumberLabel)
        view.addSubview(imageView)
        view.addSubview(emailLabel)
//        view.addSubview(signOutButton)
        
        imageView.image = UIImage(named: "myprofile")
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true
        
        
        
        usernameLabel.text = "   Username: Fawaz "
        emailLabel.text = "  Email: Fawaz@gmail.com  "
        phoneNumberLabel.text = "  Phone Number: +9659872627"
        
        
        // Do any additional setup after loading the view.
        setupUI()
        setupLayout()
        setupNaviBar()
    }
    
    func  setupUI(){
        view.backgroundColor = .white
       
        // usernameLabel.layer.borderWidth = 0.5
        usernameLabel.font = .systemFont(ofSize: 19, weight: .bold)
       
        //phoneNumberLabel.layer.borderWidth = 0.5
        phoneNumberLabel.font = .systemFont(ofSize: 19, weight: .bold)
         
        //emailLabel.layer.borderWidth = 0.5
        emailLabel.font = .systemFont(ofSize: 19, weight: .bold)
        
        //Button
        
//        signOutButton.setTitle("Sign Out", for: .normal)
//        signOutButton.backgroundColor =  #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
//        signOutButton.setTitleColor(UIColor.white, for: .normal)
//        signOutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
//        signOutButton.layer.cornerRadius = 10
//        signOutButton.layer.shadowColor = UIColor.black.cgColor
//        signOutButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//        signOutButton.layer.shadowOpacity = 0.5
//        signOutButton.layer.shadowRadius = 5.0

        
        
        
        //image-Border:
//        imageView.layer.borderWidth = 2.0
//        imageView.layer.cornerRadius = 200
//        imageView.layer.masksToBounds = true
    }
    
    
    func  setupLayout(){
        
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
           // make.leading.equalToSuperview().offset(20)
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
        }
        imageView.layer.cornerRadius = 0
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
        
//        signOutButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview().offset(350)
//            make.width.equalTo(150)
//            make.height.equalTo(50)
//            
//            
//        }
//        
//    
//        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
//        
//    }
//    
//    @objc func signOutButtonTapped(){
//        UserDefaults.standard.removeObject(forKey: "isLoggedIn")
//        
//        navigationController?.popToRootViewController(animated: true)
//        
//        let profilepage = UINavigationController(rootViewController: WelcomeScreenViewController ())
//        profilepage.modalPresentationStyle = .automatic
//        
//        
//        
  }
//   
        
        
   
      
    private func setupNaviBar() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "clock.arrow.circlepath"),
        style: .plain,
        target: self,
        action: #selector(PresentHistoryVC))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.systemBlue
    }
    
    @objc func PresentHistoryVC(){
    let profilepage = UINavigationController(rootViewController:  HistoryTableViewController())
        profilepage.modalPresentationStyle = .popover
    self.present(profilepage, animated: true)
}
   
    
    
 
    

}







//
//  WelcomeScreenViewController.swift
//  FuelAndServices
//
//  Created by Fawaz Alzamel on 12/03/2024.
//

import UIKit
import SnapKit

class WelcomeScreenViewController: UIViewController {
    
    let welcomeTextLabel = UILabel()
    let signInButton = UIButton()
    let signUpButton = UIButton()
    let topImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "logoblck"))
    imageView.contentMode = .scaleAspectFit
    return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome Page"
        view.backgroundColor = .white
        view.addSubview(welcomeTextLabel)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        setUp()
    }
    
    func setUp(){
        
        welcomeTextLabel.text = " Welcome "
        welcomeTextLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        signInButton.setTitle("Sign In", for: .normal)
       // signInButton.backgroundColor =  #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        signInButton.backgroundColor = .darkerOrange
        signInButton.setTitleColor(UIColor.white, for: .normal)
        signInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        signInButton.layer.cornerRadius = 10
        
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .darkerOrange
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        signUpButton.layer.cornerRadius = 10
        
        welcomeTextLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(welcomeTextLabel.snp.bottom).offset(-200)
            make.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.centerX.equalTo(signInButton)
        }
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }

    
    @objc func signInButtonTapped()  {
        let signInVC = SigninViewController()
        navigationController?.pushViewController(signInVC, animated: true)
    }

        @objc func signUpButtonTapped() {
            
            let signUpVC = SignUpViewController()
            
            navigationController?.pushViewController(signUpVC, animated: true)
        }
}
    







#if canImport(SwiftUI) && DEBUG
struct WelcomeScreenViewControllerPreview: PreviewProvider {
    static var previews: some View {
        WelcomeScreenViewControllerRepresentable(WelcomeScreenViewController())
    }
}
#endif




#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct WelcomeScreenViewControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {
    
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

//
//  WelcomeScreenViewController.swift
//  FuelAndServices
//
//  Created by Fawaz Alzamel on 12/03/2024.
//

import UIKit
import SnapKit

class WelcomeScreenViewController: UIViewController {
    
//    let welcomeTextLabel = UILabel()
//    let subTitleLabel = UILabel()
    let signInButton = UIButton()
    let signUpButton = UIButton()
    let topImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "logoblck"))
    imageView.contentMode = .scaleAspectFit
    return imageView
    }()
    let topImageView = UIImageView()
    let signUpQuestionLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome Page"
        view.backgroundColor = .white
        view.addSubview(topImageView)
//        view.addSubview(welcomeTextLabel)
//        view.addSubview(subTitleLabel)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        view.addSubview(signUpQuestionLabel)
        
        setUp()
    }
    
    func setUp(){
        topImageView.image = UIImage(named: "logo")
               topImageView.contentMode = .scaleAspectFit
        
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
//        welcomeTextLabel.text = "Welcome!"
//        welcomeTextLabel.font = UIFont(name: "Times New Roman", size: 25)
//        subTitleLabel.text = "All your car needs brought to you in one click"
//                subTitleLabel.font = UIFont(name: "Times New Roman", size: 18)
//                subTitleLabel.numberOfLines = 0
//                subTitleLabel.textAlignment = .left
        
        

        configureButton(signInButton, title: "Sign In", fontSize: 20)
        configureButton(signUpButton, title: "Sign Up", fontSize: 15)


        signUpQuestionLabel.text = "Don't have an account? Sign up"
        signUpQuestionLabel.font = UIFont.systemFont(ofSize: 12)
                signUpQuestionLabel.textColor = .gray
                signUpQuestionLabel.textAlignment = .center
        
        topImageView.snp.makeConstraints { make in
                  make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
                  make.leading.trailing.equalToSuperview()
                  make.height.equalTo(490)
              }
//        welcomeTextLabel.snp.makeConstraints { make in
//            make.top.equalTo(topImageView.snp.bottom).offset(40)
//                       make.leading.equalToSuperview().offset(20)
//                }
//        subTitleLabel.snp.makeConstraints { make in
//                   make.top.equalTo(welcomeTextLabel.snp.bottom).offset(5)
//                   make.leading.equalToSuperview().offset(20)
//                   make.trailing.equalToSuperview().offset(-20)
//               }
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
                        make.centerY.equalToSuperview().offset(80)
                        make.width.equalTo(200)
                        make.height.equalTo(50)
                }
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
                        make.top.equalTo(signInButton.snp.bottom).offset(20)
                        make.width.equalTo(200)
                        make.height.equalTo(50)
                }

        signUpQuestionLabel.snp.makeConstraints { make in
                   make.top.equalTo(signUpButton.snp.bottom).offset(10)
                   make.centerX.equalTo(signUpButton)
               }

        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    func configureButton(_ button: UIButton, title: String, fontSize: CGFloat) {
           button.setTitle(title, for: .normal)
           button.backgroundColor = #colorLiteral(red: 1, green: 0.5233327746, blue: 0, alpha: 1)
           button.setTitleColor(UIColor.white, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
           button.layer.cornerRadius = 25
           button.layer.shadowColor = UIColor.black.cgColor
           button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
           button.layer.shadowOpacity = 0.5
           button.layer.shadowRadius = 5.0
        
        button.snp.makeConstraints { make in
                    make.width.equalTo(180)
                    make.height.equalTo(50)
                }
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

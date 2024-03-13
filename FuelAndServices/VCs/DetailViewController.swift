//
//  DetailViewController.swift
//  FuelAndServices
//
//  Created by fatma adnan on 12/03/2024.
//

import UIKit

class DetailViewController: UIViewController {
    var historyDetails: History?

    let serviceLabel = UILabel()
    let dateLabel = UILabel()
    let historyImageView = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(serviceLabel)
        view.addSubview(dateLabel)
        view.addSubview(historyImageView)
        
        historyImageView.image = UIImage(named: "tyre")
        serviceLabel.text = " ServiceType: Tyre "
        dateLabel.text = " 12-3-2024  "
        
        
        setupViews()
        setupLayout()
        historyTypes()

        // Do any additional setup after loading the view.
    }
    
    
    func setupViews(){
        view.backgroundColor = .white
            
        serviceLabel.font = .systemFont(ofSize: 13, weight: .bold)
        dateLabel.font = .systemFont(ofSize: 16, weight: .medium)
            
        //image-Border:
        historyImageView.layer.borderWidth = 2.0
        historyImageView.layer.cornerRadius = 20
        historyImageView.layer.masksToBounds = true
       
       }
    
    func  setupLayout(){
       
        serviceLabel.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide).offset(70)
      make.centerX.equalToSuperview()
      make.height.equalTo(100)
            make.width.equalTo(100)// Example size, adjust as needed
    }

        dateLabel.snp.makeConstraints { make in
      make.top.equalTo(serviceLabel.snp.bottom).offset(60)
      make.centerX.equalToSuperview()
      }

//        historyImageView.snp.makeConstraints { make in
//      make.top.equalTo(dateLabel.snp.bottom).offset(20)
//      make.centerX.equalToSuperview()
//      }
            
    }
    
    func  historyTypes(){
        serviceLabel.text = "Service Type: \(historyDetails?.serviceType ?? "")"
        dateLabel.text = "Date: \(historyDetails?.date ?? "")"
        historyImageView.image = UIImage(named: historyDetails?.typeImage ?? "history")


    }


}

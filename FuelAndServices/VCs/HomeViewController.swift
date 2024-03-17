

import UIKit
import SnapKit
class HomeViewController: UIViewController {
    var token : String?
    let topImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo2"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fuel App Services:"
        label.textAlignment = .left
        label.font = UIFont(name: "garamond", size: 100)
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(red: 230/255, green: 130/255, blue: 0/255, alpha: 1.0)

        return label
    }()
    let subTitleDescriptionLabel: UILabel = {
           let label = UILabel()
           label.text = "Click to check services types and prices"
           label.textAlignment = .left
           label.font = UIFont.systemFont(ofSize: 12)
           label.textColor = .gray
           return label
       }()
    
    let walletLabel: UILabel = {
            let label = UILabel()
            label.text = "Wallet Balance:"
            label.textAlignment = .left
            label.font = UIFont.systemFont(ofSize: 20)
            label.textColor = .black
            return label
        }()

        let balanceLabel: UILabel = {
            let label = UILabel()
            label.text = "KWD100.00"
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textColor = .darkerOrange
            return label
        }()
    let topUpTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Enter amount"
            textField.borderStyle = .roundedRect
            textField.keyboardType = .decimalPad
            return textField
        }()
        let topUpButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Top Up", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            button.tintColor = .white
            button.backgroundColor = .darkerOrange
            button.layer.cornerRadius = 8
            button.addTarget(self, action: #selector(topUpButtonTapped), for: .touchUpInside)
            return button
        }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            //.black
        setupTopImageView()
        setupUI()
        setupWalletSection()
        self.navigationItem.backBarButtonItem?.isHidden = true
    }
    private func setupWalletSection() {
            view.addSubview(walletLabel)
            view.addSubview(balanceLabel)
        view.addSubview(topUpTextField)
            view.addSubview(topUpButton)

            walletLabel.snp.makeConstraints { make in
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-160)
                make.leading.equalToSuperview().offset(20)
            }

            balanceLabel.snp.makeConstraints { make in
                make.top.equalTo(walletLabel.snp.bottom).offset(5)
                make.leading.equalToSuperview().offset(20)
            }
        topUpTextField.snp.makeConstraints { make in
                   make.top.equalTo(balanceLabel.snp.bottom).offset(10)
                   make.leading.equalToSuperview().offset(20)
                   make.trailing.equalTo(topUpButton.snp.leading).offset(-10)
                   make.width.equalTo(150)
               }
            topUpButton.snp.makeConstraints { make in
                make.centerY.equalTo(topUpTextField)
                make.trailing.equalToSuperview().offset(-20)
                make.width.equalTo(100)
            }
        }

    @objc private func topUpButtonTapped() {
        guard let amountText = topUpTextField.text, let amount = Double(amountText) else {
               
               return
           }

           let currencySymbol = "KWD"
           let currentBalanceText = (balanceLabel.text ?? "").replacingOccurrences(of: currencySymbol, with: "")
           
           if let currentBalanceValue = Double(currentBalanceText) {
               let newBalance = currentBalanceValue + amount
               balanceLabel.text = String(format: "\(currencySymbol)%.2f", newBalance)
           }

           
            topUpTextField.text = nil
        
     
        }


    private func setupTopImageView() {
        view.addSubview(topImageView)

        topImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-80)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(290)
//            make.width.equalTo(200)
            
        }
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        setupTitleLabelConstraints()

        let card1Button = createCardButton(image: UIImage(named: "fuel2"), title: "Fuel", action: #selector(navigateToFuelList))
        let card2Button = createCardButton(image: UIImage(named: "tyre2"), title: "Tyre", action: #selector(navigateToTyreList))
        let card3Button = createCardButton(image: UIImage(named: "car"), title: "Maintenance", action: #selector(navigateToServiceList))

        let cardsStackView = UIStackView(arrangedSubviews: [card1Button, card2Button, card3Button])
        setupCardsStackView(cardsStackView)

        view.addSubview(cardsStackView)
        setupCardsStackViewConstraints(cardsStackView)
        view.addSubview(subTitleDescriptionLabel)
               setupSubTitleDescriptionLabelConstraints(subTitleDescriptionLabel, below: cardsStackView)
    }

    private func setupTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(topImageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
    private func setupSubTitleDescriptionLabelConstraints(_ label: UILabel, below view: UIView) {
           label.snp.makeConstraints { make in
               make.top.equalTo(titleLabel.snp.bottom).offset(5)
               make.leading.equalToSuperview().offset(15)
               make.trailing.equalToSuperview().offset(-30)
           }
       }
    private func createCardButton(image: UIImage?, title: String, action: Selector) -> UIView {
        let containerView = UIView()
        setupContainerView(containerView)

        let button = UIButton(type: .custom)
        setupCardButton(button, image: image, action: action)

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .black

        containerView.addSubview(button)
        containerView.addSubview(titleLabel)

        setupButtonConstraints(button)
        setupTitleLabelConstraints(titleLabel, below: button)

        return containerView
    }

    private func setupContainerView(_ containerView: UIView) {
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 4
    }

    private func setupCardButton(_ button: UIButton, image: UIImage?, action: Selector) {
        button.backgroundColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 0.4
        button.layer.borderColor = UIColor.clear.cgColor
        button.setImage(image, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
    }

    private func setupButtonConstraints(_ button: UIButton) {
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupTitleLabelConstraints(_ titleLabel: UILabel, below view: UIView) {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
    }

    private func setupCardsStackView(_ cardsStackView: UIStackView) {
        cardsStackView.axis = .horizontal
        cardsStackView.spacing = 19
        cardsStackView.distribution = .fillEqually
    }

    private func setupCardsStackViewConstraints(_ cardsStackView: UIStackView) {
        cardsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.88)
            make.height.equalTo(110)
        }
    }

    @objc private func navigateToFuelList() {
        navigateToFuelListViewController(title: "Fuel List")
    }

    @objc private func navigateToTyreList() {
        navigateToTyreListViewController(title: "Tyre List")
    }

    @objc private func navigateToServiceList() {
        navigateToServiceListViewController(title: "Maintenance List")
    }

    private func navigateToFuelListViewController(title: String) {
        let fuelVC = FuelListViewController()
        fuelVC.title = title
        navigationController?.pushViewController(fuelVC, animated: true)
    }
    private func navigateToTyreListViewController(title: String) {
        let tyreVC = TyreListViewController()
        tyreVC.title = title
        navigationController?.pushViewController(tyreVC, animated: true)
    }
    private func navigateToServiceListViewController(title: String) {
        let serviceVC = ServiceListViewController()
        serviceVC.title = title
        navigationController?.pushViewController(serviceVC, animated: true)
    }
}

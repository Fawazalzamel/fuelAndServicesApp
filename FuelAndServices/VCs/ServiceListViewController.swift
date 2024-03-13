import Eureka
import UIKit

class ServiceListViewController: FormViewController {

    let serviceData: [ServiceCellModel] = [
        ServiceCellModel(serviceType: "Oil Change", price: 50.00),
        ServiceCellModel(serviceType: "Brake Inspection", price: 30.00),
        ServiceCellModel(serviceType: "Tire Rotation", price: 25.00),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = .white
        setupForm()
    }

    private func setupForm() {
        form +++ Section("Service List")

        for service in serviceData {
            form.last!
                <<< LabelRow {
                    $0.title = service.serviceType
                    $0.value = String(format: "KWD %.2f", service.price)
                    $0.cell.imageView?.image = UIImage(named: "service2") 
                }
        }
    }
}

struct ServiceCellModel {
    var serviceType: String
    var price: Double

    init(serviceType: String, price: Double) {
        self.serviceType = serviceType
        self.price = price
    }
}

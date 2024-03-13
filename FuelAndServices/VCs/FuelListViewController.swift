import UIKit
import Eureka
import SnapKit

class FuelListViewController: FormViewController {

    let fuelData: [FuelCellModel] = [
          FuelCellModel(fuelType: "Regular", price: 2.50),
          FuelCellModel(fuelType: "Premium", price: 3.00),
          FuelCellModel(fuelType: "Diesel", price: 2.80),
      ]

      override func viewDidLoad() {
          super.viewDidLoad()
          self.tableView.backgroundColor = .white
          setupForm()
      }

      private func setupForm() {
          form +++ Section("Fuel List")

          for fuel in fuelData {
              form.last!
                  <<< LabelRow {
                      $0.title = fuel.fuelType
                      $0.value = String(format: "KWD %.2f", fuel.price)
                      $0.cell.imageView?.image = UIImage(named: "fuel2") 
                  }
          }
      }
  }

  struct FuelCellModel {
      var fuelType: String
      var price: Double

      init(fuelType: String, price: Double) {
          self.fuelType = fuelType
          self.price = price
      }
  }

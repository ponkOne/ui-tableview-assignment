//
//  ViewController.swift
//  tableView
//
//  Created by Nikita Orlov on 07/08/2023.
//

import UIKit

struct Constants {
    static let defaultCellIdentifier = "cellIdentifier"
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var cities: Array<String> = ["Brussels", "Ottawa", "Zagreb", "London", "Cairo", "Luxembourg", "Lisbon", "Singapore", "Bratislava", "Bern"]
    var countries: Dictionary<String,String> = ["Brussels": "Belgium", "Ottawa": "Canada", "Zagreb": "Croatia", "London": "England", "Cairo": "Egypt", "Paris": "France", "Luxembourg": "Luxembourg", "Lisbon": "Portugal", "Singapore": "Singapore", "Slovakia": "Bratislava", "Bern": "Switzerland"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: Constants.defaultCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.defaultCellIdentifier,
                                                          for: indexPath)
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = cities[indexPath.row]
        let country = countries[cityName]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = country
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        print("A row with [sectionIndex, rowIndex]: \(indexPath) was selected")
        tableView.deselectRow(at: indexPath,
                              animated: true)
    }
}

//
//  ViewController.swift
//  SettingsApp
//
//  Created by Davran Arifzhanov on 01.02.2021.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOption]
}

struct SettingsOption {
    let title: String
    let icon: UIImage
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure(){
        models.append(Section(title: "General", options: [
            SettingsOption(title: "WiFi", icon: UIImage(systemName: "house")!, iconBackgroundColor: .systemPink){
                print("First Cell Tapped!")
            },
            SettingsOption(title: "BlueTooth", icon: UIImage(systemName: "house")!, iconBackgroundColor: .link){
                
            },
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane")!, iconBackgroundColor: .systemGreen){
                
            },
            SettingsOption(title: "ICloud", icon: UIImage(systemName: "cloud")!, iconBackgroundColor: .systemOrange){
                
            }
        ]))
        
        models.append(Section(title: "Information", options: [
            SettingsOption(title: "WiFi", icon: UIImage(systemName: "house")!, iconBackgroundColor: .systemPink){
                
            },
            SettingsOption(title: "BlueTooth", icon: UIImage(systemName: "house")!, iconBackgroundColor: .link){
                
            },
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane")!, iconBackgroundColor: .systemGreen){
                
            },
            SettingsOption(title: "ICloud", icon: UIImage(systemName: "cloud")!, iconBackgroundColor: .systemOrange){
                
            }
        ]))
        
        models.append(Section(title: "Apps", options: [
            SettingsOption(title: "WiFi", icon: UIImage(systemName: "house")!, iconBackgroundColor: .systemPink){
                
            },
            SettingsOption(title: "BlueTooth", icon: UIImage(systemName: "house")!, iconBackgroundColor: .link){
                
            },
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane")!, iconBackgroundColor: .systemGreen){
                
            },
            SettingsOption(title: "ICloud", icon: UIImage(systemName: "cloud")!, iconBackgroundColor: .systemOrange){
                
            }
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.section].options[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        model.handler()
    }


}


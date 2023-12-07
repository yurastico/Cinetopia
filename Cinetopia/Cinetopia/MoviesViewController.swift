//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 07/12/23.
//

import UIKit

class MoviesViewController: UIViewController {
   
    
    
    var names: [String] = [
        "yuri","mamada","feijoada"
    ]
    
    private lazy var tableView: UITableView  = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "nameCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        setupNavigationBar()
        addSubviews()
        setupContraints()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    private func setupNavigationBar() {
        title = "Filmes Populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    private func setupContraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
    }
     
     

}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        //cell.textLabel?.text = names[indexPath.row] -- vai ser depreciado
        var configuration = cell.defaultContentConfiguration()
        configuration.text = names[indexPath.row]
        configuration.textProperties.color = .white
        cell.contentConfiguration = configuration
        cell.backgroundColor = .clear
        
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//
//  FindViewController.swift
//  FemaleMusic
//
//  Created by Ferdinand on 09/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialActivityIndicator

class FindViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating  {

    var trackListModel = [TrackListModel]()
    var filterTrackListModel = [TrackListModel]()
    
    //MARK: UIView Programatically

    lazy var tableView: UITableView! = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        return table
    }()

    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.dimsBackgroundDuringPresentation = false
        search.searchBar.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()

    let activityIndicator: MDCActivityIndicator = {
        let indicator = MDCActivityIndicator()
        indicator.sizeToFit()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.cycleColors = [.blue, .red, .green, .yellow]
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Find"
        
        definesPresentationContext = true
        self.tableView.register(UINib(nibName: "FindTableViewCell", bundle: nil), forCellReuseIdentifier: "findTableViewCell")

        getData(artist: "")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(tableView)
        view.addSubview(searchController.searchBar)
        view.addSubview(activityIndicator)
        setupLayout()
    }
    
    //MARK: UIView Setup Constraint Safe Area
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            searchController.searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchController.searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchController.searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchController.searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),

            ])
    }
    
    //MARK: Networking for Request Data
    
    func getData(artist:String) {
        
        activityIndicator.startAnimating()
        
        let urlComps = NSURLComponents(string: TRACK_SEARCH_URL)!
        let queryItems = [NSURLQueryItem(name: "apikey", value: API_KEY), NSURLQueryItem(name: "q_artist", value: artist), NSURLQueryItem(name: "page_size", value: "15")]
        urlComps.queryItems = queryItems as [URLQueryItem]
        
        guard let url = urlComps.url else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let jsonData = data else { return }
            do {
                let musixMatchData = try JSONDecoder().decode(MusixMatchModel.self, from: jsonData)

                DispatchQueue.main.async {
                    self.trackListModel = musixMatchData.message.body.trackListModel
                    self.tableView?.reloadData()
                }
                
                self.activityIndicator.stopAnimating()
                
            } catch let jsonError {
                print("Error: \(jsonError)")
            }
            
            }.resume()
        
    }
    
    //MARK: Searching Datasource
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! != "" {
            self.trackListModel.removeAll()
            getData(artist: searchController.searchBar.text!.lowercased())
        } else {
            self.trackListModel.removeAll()
            getData(artist: "")
        }
        
        self.tableView.reloadData()
    }
    
    //MARK: TableView Datasource and Delegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackListModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "findTableViewCell", for: indexPath) as! FindTableViewCell

        cell.trackList = trackListModel[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
    }
    
}

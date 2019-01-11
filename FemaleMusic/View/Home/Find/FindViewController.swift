//
//  FindViewController.swift
//  FemaleMusic
//
//  Created by Ferdinand on 09/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import UIKit

class FindViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating  {

    var trackListModel = [TrackListModel]()
    var filterTrackListModel = [TrackListModel]()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Find"
        
        definesPresentationContext = true
//        self.tableView.register(FindTableViewCell.self, forCellReuseIdentifier: "findTableViewCell")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        getData(artist: "")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(tableView)
        view.addSubview(searchController.searchBar)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            searchController.searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchController.searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            searchController.searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchController.searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func getData(artist:String) {
        
        let urlComps = NSURLComponents(string: TRACK_SEARCH_URL)!
        let queryItems = [NSURLQueryItem(name: "apikey", value: "4f7549e47cbd524ddda8f7ca760b4277"), NSURLQueryItem(name: "q_artist", value: artist), NSURLQueryItem(name: "page_size", value: "15")]
        urlComps.queryItems = queryItems as [URLQueryItem]
        
        guard let url = urlComps.url else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let jsonData = data else { return }
            do {
                let musixMatchData = try JSONDecoder().decode(MusixMatchModel.self, from: jsonData)
                //Get back to the main queue
                DispatchQueue.main.async {
//                    print(musixMatchData.message.body.trackList)
                    self.trackListModel = musixMatchData.message.body.trackListModel
                    self.tableView?.reloadData()
                }
                
            } catch let jsonError {
                print("Error: \(jsonError)")
            }
            
            }.resume()
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! != "" {
            self.trackListModel.removeAll()
            getData(artist: searchController.searchBar.text!.lowercased())
        }
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackListModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "findTableViewCell", for: indexPath) as! FindTableViewCell
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = trackListModel[indexPath.row].track.trackName
        cell.detailTextLabel?.text = String(trackListModel[indexPath.row].track.artistName)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
    }
    
}

//
//  ViewController.swift
//  MoviesAPI
//
//  Created by Kartikay Rane on 26/10/23.
//

import UIKit

class ViewController: UITableViewController {
    
    //MARK: Properties
    
    let reuseIdentifier = "MovieCell"
    var myMovies: [Movies]?{
        didSet{
            DispatchQueue.main.async{ [self] in
                tableView.reloadData()
            }
        }
    }
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        let movieManager = MovieManager()
        
        movieManager.fetchMovies { (movies) in
            DispatchQueue.main.async{ [self] in
                navigationItem.title = movies.title
            }
            
            self.myMovies = movies.movies
        }
    }
    
    func configureTableView(){
        tableView.backgroundColor = .red
        
        tableView.tableFooterView = UIView()
    }


}


//MARK: UITable View Data Source and Delegates

extension ViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovies?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        guard let movie = myMovies?[indexPath.row] else{return UITableViewCell()}
        cell.textLabel?.text = "\(movie.title) -- \(movie.releaseYear)"
        return cell
    }
}
    


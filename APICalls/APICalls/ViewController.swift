//
//  ViewController.swift
//  APICalls
//
//  Created by Kartikay Rane on 09/11/23.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var matches: [MatchModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MatchTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchTableViewCell")
        fetchingAPI(URL: "https://demo.sportz.io/sapk01222019186652.json") { result in
            if let result = result {
                self.matches.append(result)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        
        }
        
        fetchingAPIOP(URL: "https://demo.sportz.io/nzin01312019187360.json") { result in
            if let result = result {
                self.matches.append(result)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        
        }
    }
    
    func fetchingAPI(URL url: String, completion: @escaping (MatchModel?) -> Void) {
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if let data = data, error == nil {
                do {
                    let parsedData = try JSONDecoder().decode(MatchModel.self, from: data)
                    completion(parsedData)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            } else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }
        dataTask.resume()
    }
    
    func fetchingAPIOP(URL url: String, completion: @escaping (MatchModel?) -> Void) {
           let operationQueue = OperationQueue()
           operationQueue.addOperation {
               guard let url1 = URL(string: url) else {
                   completion(nil)
                   return
               }
               let session = URLSession.shared
               let semaphore = DispatchSemaphore(value: 0)
               let dataTask = session.dataTask(with: url1) { data, response, error in
                   defer {
                       semaphore.signal()
                   }
                   if let data = data, error == nil {
                       do {
                           let parsedData = try JSONDecoder().decode(MatchModel.self, from: data)
                           completion(parsedData)
                       } catch {
                           print("Error decoding JSON: \(error)")
                           completion(nil)
                       }
                   } else {
                       print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                       completion(nil)
                   }
               }
               dataTask.resume()
               semaphore.wait()
           }
       }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchTableViewCell", for: indexPath) as! MatchTableViewCell
        
        let match = matches[indexPath.row]
        cell.teamHomeLabel.text = "Is the match coverage live? :  \(match.matchdetail.match.livecoverage)"
        cell.teamAwayLabel.text = "Match Id :\(match.matchdetail.match.id)"
        cell.matchStatusLabel.text = "Is the match going on: \(match.matchdetail.status)"
        cell.venue.text = "Venue: \(match.matchdetail.venue.name)"
        cell.tourName.text = "TourName: \(match.matchdetail.series.tourName)"
        return cell
        
    }

    
}


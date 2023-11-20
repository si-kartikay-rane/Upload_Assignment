//
//  ViewController.swift
//  TableViewCellWithCollectionView
//
//  Created by Kartikay Rane on 02/11/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   
    
    @IBOutlet var table:UITableView!
    var models = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    func fetchData() {
        guard let url = URL(string: "https://dog.ceo/api/breed/hound/images") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching data:", error?.localizedDescription ?? "Unknown error")
                return
            }

            do {
                let apiResponse = try JSONDecoder().decode(DogApiResponse.self, from: data)
                let models = apiResponse.message?.compactMap { imageUrl in
                                return Model(text: "A dog", imageName: imageUrl)
                            } ?? []

                DispatchQueue.main.async {
                    self?.models = models
                    self?.table.reloadData()
                }
            } catch {
                print("Error decoding JSON:", error.localizedDescription)
            }
        }

        task.resume()
    }
    
}
struct Model: Codable {
    let text: String
    let imageName: String

    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }

}

struct DogApiResponse: Codable {
    let message: [String]?
    let status: String
}



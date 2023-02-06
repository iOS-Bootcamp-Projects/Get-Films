//
//  FilmsViewController.swift
//  Get Films
//
//  Created by Aamer Essa on 06/12/2022.
//

import UIKit

class FilmsViewController: UIViewController {

    @IBOutlet weak var filmsTabelList: UITableView!
    var data:Films?
    var filmsList = [Film]()
    override func viewDidLoad() {
        super.viewDidLoad()

        filmsTabelList.delegate = self
        filmsTabelList.dataSource = self
        
       let url = URL(string: "https://swapi.dev/api/films/?format=json")
        let sisson = URLSession.shared
        
        let dataTask = sisson.dataTask(with: url!) { data, respons, error in
            
            let decoder = JSONDecoder()
            
            do{
                self.data = try decoder.decode(Films.self, from: data!)
                self.filmsList = self.data!.results
                DispatchQueue.main.async {
                    self.filmsTabelList.reloadData()
                }
                
                
            }catch{
                print("\(error)")
            }
        }
        dataTask.resume()
    }
    
    


}

extension FilmsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = filmsTabelList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filmsList[indexPath.row].title
        return cell
    }
    
    
}

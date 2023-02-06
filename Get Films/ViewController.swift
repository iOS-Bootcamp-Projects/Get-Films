//
//  ViewController.swift
//  Get Films
//
//  Created by Aamer Essa on 06/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var peopleList: UITableView!
    var data:People?
    var people = [Person]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peopleList.dataSource = self
        peopleList.delegate = self
        
        let url = URL(string: "https://swapi.dev/api/people/?format=json")
        let session = URLSession.shared
        
       
        let dataTask = session.dataTask(with: url!) { data, respons, error in
            let decoder = JSONDecoder()
            do{
                self.data = try decoder.decode(People.self, from: data!)
                
                self.people = self.data!.results
                print(self.people)

                DispatchQueue.main.async {
                    self.peopleList.reloadData()
                }

            } catch{
                print("\(error)")
            }
        }
        
        dataTask.resume()
         func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
             print("DDDDDD")
            }
    }
    
  

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = peopleList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row].name
        return cell
    }
    
    
}

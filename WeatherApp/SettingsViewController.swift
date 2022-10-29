
import UIKit

class SettingsViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperaturaLabel: UILabel!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        searchController.searchBar.delegate = self
       
    }
    
    private func setupSearchBar(){
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    
    @IBAction func goToSearch(_ sender: UIButton) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "MuzTableViewController") as! MuzTableViewController
        navigationController?.pushViewController(storyboard, animated: true)
    }
}


//
//extension SettingsViewController: UISearchBarDelegate {
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
//    }
//    
//}
 

//
//extension SettingsViewController: UISearchBarDelegate{
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=9b7085fd47f84961975154505222510&q=\(searchBar.text!)&days=1&aqi=no&alerts=no"
//        var locationName: String?
//        var temperatura: Double?
//        var errorCity: Bool = false
//        var temperaturaF: Double?
//
//
//       let url = URL(string: urlString)
//        let task = URLSession.shared.dataTask(with: url!) { [weak self] data, response, error in
//            do{
//                let json = try  JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
//                if let location = json["location"] {
//                    locationName = location["name"] as? String
//                 }
//
//
//                if let current = json["current"] {
//                    temperatura = current["temp_c"] as? Double
//
//                    DispatchQueue.main.async {
//                        if errorCity {
//                            self?.cityName.text = "Ошибка в поиске"
//                            self?.temperaturaLabel.isHidden = true
//                        }else{
//                            self?.cityName.text = locationName
//                            self?.temperaturaLabel.text = "\(temperatura!)"
//                            self?.temperaturaLabel.isHidden = false
//                        }
//
//                    }
//                }
//
//            }catch let error{
//                print(error)
//            }
//        }
//        task.resume()
//    }
//}


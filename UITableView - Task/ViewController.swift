
import UIKit
struct DataModel{
    var names:String = ""
    var street:String = ""
    var images:String = ""
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    
    var arrData = [DataModel]()
    @IBOutlet weak var tableView: UITableView!
    //Creating global variables
    var names:[String] = ["Valley Tavern", "Gamine", "Saint Frank Coffee", "Doppio Zero", "Lupa Trattoria", "Beer Basement", "Home"]
    var names1:[String]!
    var street:[String] = ["1300 Union St", "1231 Fillmore St", "200 Market Street", "440 Fulton St", "200 Markter St", "323 Haight St", "960 Steiner St"]
    var street1:[String]!
    var images:[String] = ["Valley", "Gamine", "Coffee", "Doppio", "Lupa", "Beer", "Home"]
    var images1:[String]!
    var search = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrData = [
            DataModel(names: "Valley Tavern", street: "1300 Union St", images: "Valley"),
        DataModel(names: "Gamine", street: "1231 Fillmore St", images: "Gamine"),
        DataModel(names: "Saint Frank Coffee", street: "200 Market Street", images: "Coffee"),
        DataModel(names: "Doppio Zero", street: "440 Fulton St", images: "Doppio"),
            DataModel(names: "Lupa Trattoria", street: "200 Markter St", images: "Lupa"),
            DataModel(names: "Beer Basement", street: "323 Haight St", images: "Beer"),
            DataModel(names: "Home", street: "960 Steiner St", images: "Home")
        ]
        searchData()
        //Calling the function
        displaySalesData()
        
    }
    func searchData(){
        arrData = [
            DataModel(names: "Valley Tavern", street: "1300 Union St", images: "Valley"),
        DataModel(names: "Gamine", street: "1231 Fillmore St", images: "Gamine"),
        DataModel(names: "Saint Frank Coffee", street: "200 Market Street", images: "Coffee"),
        DataModel(names: "Doppio Zero", street: "440 Fulton St", images: "Doppio"),
            DataModel(names: "Lupa Trattoria", street: "200 Markter St", images: "Lupa"),
            DataModel(names: "Beer Basement", street: "323 Haight St", images: "Beer"),
            DataModel(names: "Home", street: "960 Steiner St", images: "Home")
        ]
    }
    //MARK:- function to display sales data
    func displaySalesData(){
        
        //Loading the tableview cell
        let myCell = UINib(nibName: "MyTVCell", bundle: nil)
        tableView.register(myCell, forCellReuseIdentifier: "MyTVCell")
        tableView.reloadData()
        
        search = UISearchController(searchResultsController: nil)
       // tableView.tableHeaderView = search.searchBar
        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        navigationItem.searchController = search
        search.obscuresBackgroundDuringPresentation = false
        
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchtext = search.searchBar.text else {
            return
        }
        if searchtext == ""{
            searchData()
        }else{
            searchData()
            arrData = arrData.filter{
                $0.names.contains(searchtext)
            }
            
        }
        
//        let predicate = NSPredicate(format: "self contains[c] %@", searchController.searchBar.text!)
//        names1 = ((names as NSArray).filtered(using: predicate) as! [String])
//        images1 = (images as NSArray).filtered(using: predicate) as? [String]
//        //Reloading the tableview data
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Condition to check the search is active or not
//        if search.isActive{
//            return names1.count
//        }else{
//            return names.count
//        }
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTVCell", for: indexPath) as! MyTVCell
        //Condition for search bar is active
       /* if search.isActive == true
        {
            if images1.isEmpty == true || names1.isEmpty == true{
                
                cell.name.text = "Any Name"
                let image = UIImage(named: "Lupa")
                cell.myImageView.image = image
                
            }else{
                cell.weekLabel.text = "Added LastWeek"
                cell.price.text = "$$$"
                cell.name.text = names1[indexPath.row]
                let image = UIImage(named: images1[indexPath.row])
                cell.myImageView.image = image
            }
        }else
        {
            cell.name.text = names[indexPath.row]
            cell.weekLabel.text = "Added LastWeek"
            cell.price.text = "$$$"
            cell.street.text = street[indexPath.row]
            let image = UIImage(named: images[indexPath.row])
            cell.myImageView.image = image
        }*/
        cell.name.text = arrData[indexPath.row].names
        cell.weekLabel.text = "Added LastWeek"
        cell.price.text = "$$$"
        cell.street.text = arrData[indexPath.row].street
        let image = UIImage(named: arrData[indexPath.row].images)
        cell.myImageView.image = image
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 188
    }

}


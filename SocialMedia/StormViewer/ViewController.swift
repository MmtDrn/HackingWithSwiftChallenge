import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures = pictures.sorted(by: {$0 < $1})
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pictures", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            
            detailVC.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}


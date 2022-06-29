

import UIKit

class TableDemoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var array:[(Int, String)] = [
        (1,"video"),
        (2,"audio"),
        (7,"video"),
        (5,"text"),
        (6,"video"),
        (8,"text"),
        (3,"audio"),
        (5,"video"),
        (8,"video")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let object = (Int.random(in: 0...100),"video")
        array.append(object)
        tableView.reloadData()
    }
    
    
}

extension TableDemoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as? DemoTableViewCell
        else { return UITableViewCell() }
        cell.configure(with: array[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.array.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if array[indexPath.row].1 == "video" {
            print("Watching video")
        }
        
        if array[indexPath.row].1 == "audio" {
            print("Playing audio")
        }
        
        if array[indexPath.row].1 == "text" {
            print("reading...")
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if array[indexPath.row].1 == "video" {
            return 80
        }
        
        if array[indexPath.row].1 == "audio" {
            return 45
        }
        
        if array[indexPath.row].1 == "text" {
            return 30
        }
        
        return 50
        
    }
    
}

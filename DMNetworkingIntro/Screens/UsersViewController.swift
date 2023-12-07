//
//  UsersViewController.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import UIKit

/**
 1. Create the user interface. See the provided screenshot for how the UI should look.
 2. Follow the instructions in the `User` file.
 3. Follow the instructions in the `NetworkManager` file.
 */
class UsersViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    
    var usersData = [User]()
    
    
    
    /**
     5. Connect the UITableView to the code. Create a function called `configureTableView` that configures the table view. You may find the `Constants` file helpful. Make sure to call the function in the appropriate spot.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getUsers()
        
    }
    
    /**
     6.1 Set the `NetworkManager`'s delegate property to the `UsersViewController`. Have the `UsersViewController` conform to the `NetworkManagerDelegate` protocol. Call the `NetworkManager`'s `getUsers` function. In the `usersRetrieved` function, assign the `users` property to the array we got back from the API and call `reloadData` on the table view.
     */
    func getUsers() {
        NetworkManager.shared.getUsers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    self.usersData = users
                    
                    self.tableView.reloadData()
                case .failure(let error):
                    let alertController = UIAlertController(title: error.rawValue, message: "Error! Try Again.", preferredStyle:  UIAlertController.Style.alert)
                    
                    let alertAction = UIAlertAction(title: "Return", style: .default)
                    
                    alertController.addAction(alertAction)
                    
                    self.present(alertController, animated: true)
                }
            }
            
        }
        
        
        
    }
    
    func configureTableView(){
        tableView.dataSource = self
        
    }
}


extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        cell?.textLabel?.text = usersData[indexPath.row].firstName
        cell?.detailTextLabel?.text = usersData[indexPath.row].email
        
        
        return cell!
    }
    
    
}




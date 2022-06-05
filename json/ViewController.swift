//
//  ViewController.swift
//  json
//
//  Created by Bachana Sanadiradze on 05.06.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    final let url = URL(string: "https://dummyjson.com/products")
    
    @IBOutlet weak var tableView: UITableView!
    
   private var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        downloadJson()
        tableView.tableFooterView = UIView()
    }
   
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {return UITableViewCell()}
        cell.price.text = "Price:" +  String(products[indexPath.row].price)
        cell.stock.text = "Stock:" + String(products[indexPath.row].stock)
        cell.brand.text = products[indexPath.row].brand
        
           if let imageURL = URL(string: products[indexPath.row].thumbnail){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.productImage.image = image
                        
                    }
                }
            }
            
            
        }
        
        return cell
    }
    
    
    func downloadJson() {
        guard let donwloadURL = url else {return}
        URLSession.shared.dataTask(with: donwloadURL) { data, urlResponse, error in
            
            guard let data = data, error == nil, urlResponse != nil else { print("something is wrong")
                return
                
            }
            print("download")
            do {
                let decoder = JSONDecoder()
                let downloadedProducts = try decoder.decode(Products.self, from: data)
                self.products = downloadedProducts.products
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                
            }
        }.resume()
    }

}


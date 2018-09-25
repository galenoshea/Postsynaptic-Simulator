//
//  TableViewController.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-08-06.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let levels = [("Level 1", "Beginning"), ("Level 2", "Regenerative Action Potentials"), ("Level 3", "Spatial Summation"), ("Level 4", "Temporal Summation"), ("Level 5", "Coincidence Potentiation"), ("Level 6", "Inhititory Transmitters"), ("Level 7", "Spatial Summation vs Decay"), ("Level 8", "Threshold & Action Potentials")]
    private let cellIdentifier = "customCell"
    private var cellRow = 0
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = "Levels"
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return levels.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! CustomTableViewCell
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height/2
        
        let selectedColorView = UIView()
        selectedColorView.backgroundColor = UIColor.purple
        cell.selectedBackgroundView = selectedColorView
        
        cell.levelLabel.text = "\(levels[indexPath.row].0): \(levels[indexPath.row].1)"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let levelViewController = segue.destination as? GameViewController {
            levelViewController.name = levels[self.cellRow].0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cellRow = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "Level", sender: nil)
    }
    
}

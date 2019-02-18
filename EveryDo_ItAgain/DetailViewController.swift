//
//  DetailViewController.swift
//  EveryDo_ItAgain
//
//  Created by Kamal Maged on 2019-02-17.
//  Copyright © 2019 Kamal Maged. All rights reserved.
//

import UIKit

protocol DetailControllerDelegate: AnyObject {
    func saveStatus(detailItem: ToDo)
}

class DetailViewController: UIViewController {

   
    @IBOutlet weak var toDoTitle: UILabel!
    
    @IBOutlet weak var toDoDescription: UILabel!
    
    @IBOutlet weak var toDoPriority: UILabel!
    
    @IBOutlet weak var toDoStatus: UILabel!
    
    @IBOutlet weak var statusIndication: UISwitch!
    
     weak var delegate: DetailControllerDelegate?
    
    func configureView() {
        // Update the user interface for the detail item.
        if let toDo = detailItem {
    
            toDoTitle?.text = toDo.title!.description

            toDoPriority?.text = toDo.priorityNumber.description

            toDoDescription?.text = toDo.toDoDescription?.description
            
            if toDo.isComplete {
                toDoStatus?.text = "Finished"
                
            } else {
                toDoStatus?.text = "Pending"
            }
          
            statusIndication?.isOn = toDo.isComplete
            
       }
    }

    @IBAction func changeStatus(_ sender: UISwitch) {
        if let toDo = detailItem {
            toDo.isComplete = sender.isOn
            configureView()
            delegate?.saveStatus(detailItem: detailItem!)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureView()
    }

    var detailItem: ToDo? {
        didSet {
            // Update the view.
            
            configureView()
        }
    }


}


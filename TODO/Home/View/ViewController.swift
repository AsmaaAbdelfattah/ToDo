//
//  ViewController.swift
//  TODO
//
//  Created by asma abdelfattah on 16/05/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusBtn: UIButton!{
        didSet{
            plusBtn.setTitle("", for: .normal)
        }
    }
    @IBOutlet weak var tasksTB: UITableView!{
        didSet{
            //tasksTB.register(UINib(nibName: "TODOTBCell", bundle: nil), forCellReuseIdentifier: "TODOTBCell")
            tasksTB.dataSource = self
            tasksTB.delegate = self
            tasksTB.rowHeight = 60
        }
    }
    //MARK: vars
    let coreDataManager = TaskManager.shared
    var tasks:[TaskEntity]?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      reloadData()
    }
    
    func reloadData(){
        coreDataManager.fetchTasks()
        tasks = coreDataManager.tasks
        tasksTB.reloadData()
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Task!", message: "Please Enter Task Name", preferredStyle: .alert)
            
            // Add text field
            alert.addTextField { textField in
                textField.placeholder = "Enter Title For Task"
            }
            
            // Save action
            let saveAction = UIAlertAction(title: "Save", style: .default) {[weak self] _ in
                if let newText = alert.textFields?.first?.text, !newText.isEmpty {
                    self?.coreDataManager.addTask(title: newText)
                    self?.reloadData()
                }
            }
            
            // Cancel action
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(saveAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TODOTBCell", for: indexPath) as? TODOTBCell else {return UITableViewCell()}
        if let task = tasks?[indexPath.row]{
            cell.injectCell(item: task)
        }
        cell.doneHandler.tag = indexPath.row
        cell.doneHandler.addTarget(self, action: #selector(handleDone), for: .valueChanged)
        return cell
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete , let item = tasks?[indexPath.row] {
             coreDataManager.deleteTask(item)
             tasks?.remove(at: indexPath.row)
             
             tableView.deleteRows(at: [indexPath], with: .fade)
         }
    }
    @objc func handleDone(_ sender: UISwitch){
        if let item = tasks?[sender.tag]{
            coreDataManager.toggleTask(item)
        }
    }
}


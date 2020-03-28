//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages :[Message] = [
        Message(sender: "abang@bola.com", body: "Bola Oh Bola"),
        Message(sender: "abang@kotak.com", body: "Kotak Oh Kotak"),
        Message(sender: "abang@bola.com", body: "Oh Bukan Bola")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat with A Ball"
        tableView.dataSource = self

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = self.messages[indexPath.row].body
        return cell
    }
}



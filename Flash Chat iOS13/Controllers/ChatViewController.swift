//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    let db = Firestore.firestore()
    
    var messages :[Message] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat with A Ball"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib.init(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        loadMessages()
    }
    
    
    func loadMessages() {
        db.collection(Constants.collectionsName).order(by: Constants.dateField).addSnapshotListener { (snapshot, error) in
            if error==nil {
                self.messages = []
                if let snapsDoc = snapshot?.documents {
                    for doc in snapsDoc {
                        let d = doc.data()
                        if let sender = d[Constants.senderField] as? String, let body = d[Constants.bodyField] as? String {
                            let newMessage = Message(sender: sender, body: body)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            } else {
                print("Error retrieving data")
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        //messages.append(Message(sender:"abang@bola.com",body: messageTextfield.text!))
        //tableView.reloadData()
        if let senderField = Auth.auth().currentUser?.email, let bodyField = messageTextfield.text {
            db.collection(Constants.collectionsName).addDocument(data:
                [Constants.dateField : Date().timeIntervalSince1970,
                 Constants.senderField : senderField,
                 Constants.bodyField : bodyField]) {err in
                    if err==nil {
                        print("Message Added")
                    } else {
                        print("Error adding message")
                    }
            }
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.message.text = messages[indexPath.row].body
        cell.meProfileImage.isHidden = false
        cell.youProfileImage.isHidden = false
        if let currentUser = Auth.auth().currentUser?.email {
            if  currentUser==messages[indexPath.row].sender {
                cell.youProfileImage.isHidden = true
            } else {
                cell.meProfileImage.isHidden = true
            }
        }
        return cell
    }
}


extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

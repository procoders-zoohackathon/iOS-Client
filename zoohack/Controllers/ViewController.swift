//
//  ViewController.swift
//  zoohack
//
//  Created by Aditya Verma on 07/10/17.
//  Copyright © 2017 Aditya Verma. All rights reserved.
//

import UIKit
import Starscream
import SwiftyJSON
import AVFoundation

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, WebSocketDelegate {
    
    var socket = WebSocket(url: URL(string: "ws://localhost:8080/connect")!)
    let speechSynth = AVSpeechSynthesizer()
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("Connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("Disconnected")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
//        print("Message: \(text)")
        if let dataFromString = text.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            if let alert = json["data"]["data"].string {
                DataService.instance.alert.append(AlertModel(message: alert))
                let speechUtter = AVSpeechUtterance(string: alert)
                
                speechSynth.speak(speechUtter)
                
                tableView.beginUpdates()
                let arr = [IndexPath(row: DataService.instance.alert.count - 1, section: 0)]
                tableView.insertRows(at: arr as? [IndexPath] ?? [IndexPath](), with: .automatic)
                tableView.endUpdates()
            }
        }
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Data Received")
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        socket.delegate = self
        socket.connect()
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell") as? AlertTableViewCell {
            let alert = DataService.instance.getData()[indexPath.row]
            cell.updateViews(alert: alert)
            return cell
        } else {
            return AlertTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = DataService.instance.getData()[indexPath.row]
        performSegue(withIdentifier: "toMaps", sender: alert)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let maps = segue.destination as? MapsViewController {
            maps.initCoordinate(latitude: 28.6132785, longitude: 77.2922331)
        }
    }
    
}


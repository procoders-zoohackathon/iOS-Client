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
    var latitude: Double!
    var longitude: Double!
    var number: String!
    var name: String!
    
    func initLogin(number: String) {
        self.number = number
    }
   
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
        print(self.number)
        if let dataFromString = text.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
            if let alert = json["data"]["data"]["type"].string {
                let date = dateFormating(date: json["data"]["data"]["time"].string!)
                DataService.instance.alert.append(AlertModel(message: json["data"]["data"]["message"].string!, latitude: json["data"]["data"]["location"]["latitude"].double!, longitude: json["data"]["data"]["location"]["longitude"].double!, time: date, mainTitle: alert))
                let speechUtter = AVSpeechUtterance(string: alert)
                let alertUtter = AVSpeechUtterance(string: json["data"]["data"]["message"].string!)
                speechSynth.speak(speechUtter)
                speechSynth.speak(alertUtter)
                tableView.beginUpdates()
                let arr = [IndexPath(row: DataService.instance.alert.count - 1, section: 0)]
                tableView.insertRows(at: arr as? [IndexPath] ?? [IndexPath](), with: .automatic)
                tableView.endUpdates()
            }
            print(json["data"]["data"])
           
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
        self.latitude = alert.latitude
        self.longitude = alert.longitude
        self.name = alert.message
        performSegue(withIdentifier: "toMaps", sender: alert)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let maps = segue.destination as? MapsViewController {
            maps.initCoordinate(latitude: self.latitude, longitude: self.longitude, locationName: self.name)
        }
    }
    func dateFormating(date: String) -> String {
        let format = ISO8601DateFormatter()
        let timeISO = format.date(from: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        let time = formatter.string(from: timeISO!)
        return String(describing: time)
    }
    
}


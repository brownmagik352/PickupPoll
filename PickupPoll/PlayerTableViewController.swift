//
//  PlayerTableViewController.swift
//  PickupPoll
//
//  Created by Apurv Suman on 12/23/16.
//  Copyright © 2016 Apurv Suman. All rights reserved.
//

import UIKit
import os.log

class PlayerTableViewController: UITableViewController {
    
    // MARK: Properties
    var players = [Player]()
    
    func loadSamplePlayers() {
        let player1 = Player(name: "You", playing: true)
        let player2 = Player(name: "Your Friend", playing: false)
        
        players += [player1, player2]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem

        // Load any saved players, otherwise load sample data.
        if let savedPlayers = loadPlayers() {
            players += savedPlayers
        }
        else {
            // Load the sample data.
            loadSamplePlayers()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return players.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PlayerTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlayerTableViewCell

        let player = players[indexPath.row]
        cell.nameLabel.text = player.name
        cell.playingSwitch.isOn = player.playing
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
        // Save the data
        savePlayers()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    */
    
    @IBAction func unwindToPlayerList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddPlayerViewController, let player = sourceViewController.player {
            
            // Add a new player
            let newIndexPath = IndexPath(row: players.count, section: 0)
            
            players.append(player)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
            // Save the data
            savePlayers()
        }
    }

    // MARK: Actions
    
    // update the player's status from the switch
    @IBAction func flipSwitched(_ sender: UISwitch) {

        let cell = sender.superview?.superview as! PlayerTableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let player = players[indexPath!.row]
//        print("OLD STATE: \(player.playing)")
        player.playing = sender.isOn
//        print("NEW STATE: \(player.playing)")
        
        // Save the data
        savePlayers()
        
    }
    
    // MARK: Private Methods
    private func savePlayers() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(players, toFile: Player.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Players successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save players...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadPlayers() -> [Player]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Player.ArchiveURL.path) as? [Player]
    }

}

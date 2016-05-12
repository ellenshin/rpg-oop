//
//  ViewController.swift
//  rpgoop
//
//  Created by Ellen Shin on 5/11/16.
//  Copyright © 2016 Ellen Shin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!

    
    var player: Player!
    var enemy: Enemy!
    var chestMsg: String?
    override func viewDidLoad() {
        player = Player(name: "DirtyLaundry", hp: 110, attackPwr: 20)
        playerHpLbl.text = "\(player.hp) HP"
        generateRandEnemy()
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func generateRandEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        enemyImg.hidden = false
    }
    @IBAction func onChestTap(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMsg
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandEnemy), userInfo: nil, repeats: false)
        
    }

    @IBAction func attackTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            chestMsg = "\(player.name) found \(loot)"
            player.addItemToInventory(loot)
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }

}












//
//  ViewController.swift
//  Guess Number
//
//  Created by Andrew Mellen on 10/2/15.
//  Copyright © 2015 Andrew Mellen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var highOrLow: UILabel!
    @IBOutlet var inputText: UITextField!
    @IBOutlet var guessesRemaining: UILabel!
    @IBOutlet var suggestText: UILabel!
    @IBOutlet var betweenText: UILabel!
    @IBOutlet var image: UIImageView!
    var answer = Int(arc4random_uniform(101))
    var guesses = 5
    var min = 1
    var max = 100
    var suggestedGuess = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        image.image = UIImage(named: "swaggy.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reset(){
        guesses = 5
        min = 1
        max = 100
        suggestedGuess = 50
        answer = Int(arc4random_uniform(101))
    }

    func dispText(){
        guessesRemaining.text = "You have \(guesses) guesses remaining."
        suggestText.text = "I suggest guessing: \((min + max) / 2)"
        betweenText.text = "Number is between \(min) and \(max)."
        inputText.text = ""
    }

    func calculate(){
        let num = Int(inputText.text!)
        if(num == answer){
            highOrLow.text = "YOU WIN!"
            reset()
        }
        else{
            if(num > answer){
                highOrLow.text = "Too High!"
                if(num <= 100 && num <= max){
                    max = num!
                }
            }
            else if(num >= 0 && num >= min){
                highOrLow.text = "Too Low!"
                min = num!
            }
            guesses--
            if(guesses == 0){
                highOrLow.text = "YOU LOSE! The number was: \(answer)."
                reset()
            }
        }
        dispText()
    }
    
    @IBAction func enterButton(sender: AnyObject) {
        calculate()
    }
    
    
}
//
//  ViewController.swift
//  Silly Song
//
//  Created by dev on 16.08.2017.
//  Copyright © 2017 dev. All rights reserved.
//

import UIKit


func shortName(name2: String) -> String{
    var name = name2
    String(name.remove(at: name2.startIndex))
    
    return name
}
var bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let short = shortName(name2: fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: short)
    print(lyrics)
    return lyrics
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricView: UITextView!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resett(_ sender: Any) {
        nameField.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let name: String = nameField.text!
        
        lyricView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
    }
    
    @IBAction func zero(_ sender: Any) {
        lyricView.text = ""
    }
    
}


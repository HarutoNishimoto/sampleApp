//
//  ViewController.swift
//  sampleApp
//
//  Created by Nishimoto Haruto on H31/12/18.
//  Copyright © 平成31年 Nishimoto Haruto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {




    @IBOutlet weak var inputText: UILabel!
    @IBOutlet weak var outputText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // ビューがロードされた時点の処理
        // 式と答えのラベルは空にする
        inputText.text = ""
        outputText.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 数字のキーが押されたとき
    @IBAction func inputKey(sender: UIButton) {
        // 入力されるたびに文字を連結して変数を変更
        guard let inputKey = inputText.text else {
            return
        }
        guard let senderedText = sender.titleLabel?.text else {
            return
        }
        inputText.text = inputKey + senderedText
    }
    
    @IBAction func inputClear(sender: UIButton) {
        // 式と答えのラベルは空にする
        inputText.text = ""
        outputText.text = ""
    }
    
    
    
    @IBAction func inputEqual(sender: UIButton) {
        // =ボタンが押されたら答えを計算して表示する
        guard let formulaText = inputText.text else {
            return
        }
        outputText.text = calFormula(formulaText)
    }
    
    // 式のエラーを検知する文を書きましょう
    private func detectError(text: String) throws {
        
        if (text.containsString("++") || text.containsString("-+") || text.containsString("+-") || text.containsString("--")) {
            throw NSError(domain: "変なこと書くな", code: -1, userInfo: nil)
        }
        print(text)
    }
    
    private func calFormula(_ formula: String) -> String {
        do {
            //let answer = De(formula
            try detectError(formula)
            let answer = formula
            return String(answer)
        } catch {
            // 計算式が不当だった場合
            return "式を正しく入力してください"
        }
    }

}


//
//  ViewController.swift
//  MarubatusApp
//
//  Created by 田中 大地 on 2018/10/27.
//  Copyright © 2018 tanaka daichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Label: UILabel!
    
    //問題番号の格納
    var currentQuestionNum: Int = 0
    
    let questions:[[String: Any]] = [
    [
        "question": "iphoneアプリの開発統合環境はZcodeである",
        "answer": false
        ],
    [
        "question": "xcode画面の右側にはユーティリティーズがある",
        "answer": true
        ],
    [
        "question": "UILabelは文字列を表示する際に利用する",
        "answer": true
    ]
    ]
    
    //この関数が配列を表示する
    func showQuestion(){
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String{
            Label.text = que
        }
    }
    
    
    func checkAnswer(yourAnswer: Bool){
        
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool{
            
            if yourAnswer == ans{
                
                currentQuestionNum += 1
                
                //正解のアラートを表示する処理
                showAlert(message: "正解")
                
            }else{
              
                showAlert(message: "不正解")
            }
    //問題がなくなったら元に戻る処理
            if currentQuestionNum > question.count{
                currentQuestionNum = 0
            }
            
            }
            showQuestion()
        }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert,animated: true,completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //実行させる処理
        showQuestion()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func yesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    
    
    @IBAction func noButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
        
    }
    

}


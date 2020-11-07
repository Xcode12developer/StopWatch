//
//  ViewController.swift
//  Timer
//
//  Created by Mohamad Mortada on 11/6/20.
//

import UIKit

class ViewController: UIViewController {
    let colors:[UIColor] = [.systemIndigo, .systemTeal, .systemPink, .systemGreen, .systemOrange, .systemYellow, .magenta, .systemRed]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // frames and adding to the view
        label.frame = CGRect(x: 15, y: 100, width: 400, height: 90)
        button.frame = CGRect(x: 280, y: 300, width: 100, height: 90)
        button.addTarget(self, action: #selector(Start), for: .touchUpInside)
        view.addSubview(button)
        button1.frame = CGRect(x: 60, y: 300, width: 100, height: 90)
        button1.addTarget(self, action: #selector(Stop), for: .touchUpInside)
        view.addSubview(button1)
        view.addSubview(label)
    }
    
   
    
    var hour = 0
    var min = 0
    var sec = 0
    var decider = 0
    func createTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1,
                                     repeats: true)
                                    {  timer in
            if self.decider == 100 {
            timer.invalidate()
            print("Timer Stopped")
        }
            else{
        DispatchQueue.main.async {
            
            
            self.view.backgroundColor = self.colors.randomElement() ?? .white
            if self.min == 59 {
                self.hour += 1
                self.label.text = "\(String(withInt:self.hour)):\(String(withInt: self.min)):\(String(withInt:self.sec))"
                self.sec = 0
                self.min = 0
                print("1 hour")
            }
            if self.sec == 59 {
                self.min += 1
                self.label.text = "\(String(withInt:self.hour)):\(String(withInt: self.min)):\(String(withInt:self.sec))"
                self.sec = 0
               
            }
            if self.sec >= 9 {
                self.sec += 1
                self.label.text = "\(String(withInt: self.hour)):\(String(withInt: self.min)):\(String(withInt:self.sec))"
            }
            if self.sec < 10 {
                self.sec += 1
                self.label.text = "\(String(withInt:self.hour)):\(String(withInt: self.min)):\(String(withInt: self.sec))"
            }
            
            
        }
            }
    }
    }
    // configure the UIs
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Start Timer", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 43
        return button
    }()
    
    
    private let button1: UIButton = {
        let button = UIButton()
        button.setTitle("Stop", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 43
        return button
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = label.font.withSize(80)
        label.textAlignment = .center
        return label
    }()
    
  
   
   
    @objc func Stop() {
        decider = 100
        createTimer()
        }
    
   
    @objc func Start() {
        decider = 0
        createTimer()
        }

}

// To make the mins hours and secs have 2 digits
extension String {

    init(withInt int: Int, leadingZeros: Int = 2) {
        self.init(format: "%0\(leadingZeros)d", int)
    }

    func leadingZeros(_ zeros: Int) -> String {
        if let int = Int(self) {
            return String(withInt: int, leadingZeros: zeros)
        }
        print("Warning: \(self) is not an Int")
        return ""
    }

}

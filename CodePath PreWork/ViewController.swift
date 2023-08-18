//
//  ViewController.swift
//  CodePath PreWork
//
//  Created by Xavian Romeu on 8/17/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var colorChangeButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var isImageSwitched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set label texts
        nameLabel.text = "Xavian Romeu"
        universityLabel.text = "FIU"
        jobLabel.text = "Mobile Dev"
        
        // Customize the button
        colorChangeButton.backgroundColor = UIColor.blue
        colorChangeButton.setTitle("Change Color", for: .normal)
        
        // Set up the initial image
        imageView.image = UIImage(named: "firstPicture")
        imageView.layer.cornerRadius = imageView.frame.size.width / 2.5 // Make image view circular
        imageView.clipsToBounds = true
        
        // Add tap gesture recognizers to labels
        let nameLabelTap = UITapGestureRecognizer(target: self, action: #selector(changeImage(_:)))
        nameLabel.addGestureRecognizer(nameLabelTap)
        
        let universityLabelTap = UITapGestureRecognizer(target: self, action: #selector(changeImage(_:)))
        universityLabel.addGestureRecognizer(universityLabelTap)
        
        let jobLabelTap = UITapGestureRecognizer(target: self, action: #selector(changeImage(_:)))
        jobLabel.addGestureRecognizer(jobLabelTap)
        
        // Enable user interaction for labels
        nameLabel.isUserInteractionEnabled = true
        universityLabel.isUserInteractionEnabled = true
        jobLabel.isUserInteractionEnabled = true
        
        // Change label appearance
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        universityLabel.font = UIFont.boldSystemFont(ofSize: 18)
        jobLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        // Customize the button
        colorChangeButton.backgroundColor = UIColor.systemGreen // Change to your desired background color
        colorChangeButton.setTitle("Change Color", for: .normal)
        colorChangeButton.setTitleColor(UIColor.white, for: .normal)
        colorChangeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        colorChangeButton.layer.cornerRadius = 10
        colorChangeButton.clipsToBounds = true
    }
    
    @objc func changeImage(_ sender: UITapGestureRecognizer) {
        if sender.view == nameLabel {
            imageView.image = UIImage(named: "firstPicture")
            nameLabel.textColor = UIColor.blue // Change to your desired color
        } else if sender.view == universityLabel {
            imageView.image = UIImage(named: "secondPicture")
            universityLabel.textColor = UIColor.green // Change to your desired color
        }else if sender.view == jobLabel {
            imageView.image = UIImage(named: "thirdPicture")
            jobLabel.textColor = UIColor.systemPink // Change to your desired color
        }
        
        // Reset image and label colors after 10 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.imageView.image = UIImage(named: "firstPicture")
            self.nameLabel.textColor = UIColor.black // Reset label color
            self.universityLabel.textColor = UIColor.black // Reset label color
        }
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        let randomColor = changeColor()
        view.backgroundColor = randomColor
        colorChangeButton.backgroundColor = UIColor.systemBlue
    }
    
    func changeColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
}


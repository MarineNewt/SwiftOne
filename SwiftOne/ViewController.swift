//
//  ViewController.swift
//  SwiftOne
//
//  Created by Frankie Leyva on 12/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let colors: [UIColor] = [
        .systemCyan,
        .systemPink,
        .systemMint,
        .systemBrown,
        .systemYellow,
        .systemTeal,
        .systemGray
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemCyan
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(Tapbutton), for: .touchUpInside)
        
        getRandomPhoto()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 35,
            y: view.frame.size.height-200-view.safeAreaInsets.bottom,
            width: view.frame.size.width-70,
            height: 55
            )
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    @objc func Tapbutton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }


}


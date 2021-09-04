//
//  onboardingScreen.swift
//  correctECCedit
//
//  Created by Leona  Meharenna on 8/4/21.
//

import UIKit

class onboarderScreen: UIViewController {
    
    @IBOutlet var holderView: UIView!

    

    let scrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.4033207297, green: 0.7025354505, blue: 0.4164156914, alpha: 1).cgColor, UIColor(red: 0/255, green: 130/255, blue: 25/255, alpha: 1).cgColor]

        gradientLayer.shouldRasterize = true
        holderView.layer.addSublayer(gradientLayer)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            configure()
    }
    
    private func configure() {
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        let titles = ["Our Mission", "Map", "Volunteer Opportunities", "Upload Locations", "Your Profile", "Let's go!"]
        let textDesc = ["312 Pantry's mission is to reduce the stigma surrounding food insecurity by giving a platform to the many food pantries that exist in many Chicago Neighborhoods, as well as give users the chance to give back to their community by donations and volunteer work.", "Find nearby pantries by using our map feature. Simply type in your zip code to find pantries near you—or allow our app to access your location for easier searching.", "Find volunteer opportunities by clicking on the 'volunteer' tab.", "Can't find a pantry you're looking for? Have a volunteer opportunity you think people would be interested in? Upload it using our upload feature! Be sure to give us your email so we can update you on the status of your submission.", "Your profile can be used to save your favorite locations from the map, as well as volunteer opportunities you're interested in.", "Now that you know how the app works, let's get started!"]
        for x in 0..<6 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width - 20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+120+10, width: pageView.frame.size.width-20, height: 300))
            let description = UILabel(frame: CGRect(x: 10, y: 10+120+10+350, width: pageView.frame.size.width - 40, height: 200))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width - 20, height: 50))
            label.textAlignment = .center
            label.textColor = .white
            label.font = UIFont(name: "Arial Rounded MT Bold", size: 32)
            pageView.addSubview(label)
            label.text = titles[x]

            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "mission_\(x)")
            pageView.addSubview(imageView)
            
            description.textAlignment = .center
            description.numberOfLines = 0
            description.textColor = .white
            description.font = UIFont(name: "Helvetica-Bold", size: 20)
            pageView.addSubview(description)
            description.text = textDesc[x]
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Continue", for: .normal)
            
            if x == 5{
                button.setTitle("Get started", for: .normal)
            }
            
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
        }
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3, height: 0)
        scrollView.isPagingEnabled = true
    }
    
    @objc func didTapButton(_ button: UIButton){
        guard button.tag < 6 else {
            
            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
            return
        }
        
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width*CGFloat(button.tag), y: 0), animated: true)
        
    }
    


}

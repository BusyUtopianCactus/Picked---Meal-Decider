//
//  finalFoodChooserViewController.swift
//  FoodSwipe
//
//  Created by Ilana Basman on 8/1/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import UIKit


import MapKit
import CoreLocation

class finalFoodChooserViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    // MARK: Properties
    var deletedItem: String = ""
    
    @IBAction func rightChoiceClicked(_ sender: Any) {
        
        let latitude = ((self.locationManager.location?.coordinate.latitude)!)
        let longitude = ((self.locationManager.location?.coordinate.longitude)!)
        print(longitude)
        print(latitude)

        let urlString = "http://maps.apple.com/?q=\(foodArray[1])+food+nearby"
        //&sll=\(latitude),\(longitude)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    @IBAction func leftChoiceClicked(_ sender: Any) {
        let latitude = ((self.locationManager.location?.coordinate.latitude)!)
        let longitude = ((self.locationManager.location?.coordinate.longitude)!)
        print(longitude)
        print(latitude)

        let urlString = "http://maps.apple.com/?q=\(foodArray[0])+food+nearby"
        //&sll=\(latitude),\(longitude)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    }
  
    @IBOutlet weak var rightFoodPic: UIImageView!
    @IBOutlet weak var leftFoodPic: UIImageView!
   // @IBOutlet weak var foodPic: UIImageView!
    @IBOutlet weak var rightButtonClicked: UIButton!
    @IBOutlet weak var leftButtonClicked: UIButton!
    
    @IBOutlet weak var lastFoodRight: UITextField!
    @IBOutlet weak var lastFoodLeft: UITextField!
 
    
    
    
    var swipeDown: UISwipeGestureRecognizer!
    var swipeRight: UISwipeGestureRecognizer!
    var swipeLeft: UISwipeGestureRecognizer!
    var index = 0
    var didSwipe = false
    var foodChoices = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
    var foodArray = [""]
    
    var lastChoice: Choice?
    struct Choice {
        var operation: Operation
        var value: String!
    }
    enum Operation {
        case right
        case left
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (foodArray)
        leftFoodPic.image = UIImage(named: foodArray[0])
        rightFoodPic.image = UIImage(named: foodArray[1])
        lastFoodLeft.text = foodArray[0]
        lastFoodRight.text = foodArray[1]
        
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        //locationManager.stopUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func generateAnswer() {
  

    }
    
    
}


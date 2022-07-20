//
//  ViewController.swift
//  FoodSwipe
//
//  Created by Ilana Basman on 7/24/18.
//  Copyright © 2018 MakeSchool. All rights reserved.


import CoreLocation
import MapKit
import Koloda
class ViewController: UIViewController {


    // MARK: Properties
    var foodChoiceRestart = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
    var deletedItemArray = [foodObj]()
    var deletedItem: String = ""
    let locationManager = CLLocationManager()
    var restarterArray = [String]()
   
    // MARK: Undo button
    @IBAction func restartChoiceClicked(_ sender: UIBarButtonItem) {
        
//        foodChoices.insert(deletedItem, at: index)
//        kView.image = UIImage(named: deletedItem)
        foodCategory.text = deletedItem
//        deniedCounterIndex = deniedCounterIndex - 1
//        deniedFoodCounter.text = String(("Rejected: \(deniedCounterIndex)/16"))
        //foodChoices.append(deletedItem)
        print("Undo pressed: \(deletedItem)")
//        print(foodChoices)
                print("Hi")
    }

    
//    @IBAction func upButtonClicked(_ sender: UIButton) {
//        if CLLocationManager.locationServicesEnabled() {
//            print ("Its all on")
//        } else {
//            if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION") {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        }
//        let latitude = ((self.locationManager.location?.coordinate.latitude))
//        let longitude = ((self.locationManager.location?.coordinate.longitude))
//
//
//
//        let urlString = "http://maps.apple.com/?q=\(foodChoices[index])+nearby&near=\(String(describing: latitude)),\(String(describing: longitude))@z=10"
//        if let url = URL(string: urlString) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//
//        }
//    }
    
    @IBOutlet weak var restartWholeApp: UIBarButtonItem!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var resetChoices: UIBarButtonItem!

//    @IBOutlet weak var deniedFoodCounter: UILabel!
//    @IBOutlet weak var foodCounter: UILabel!
   // @IBOutlet weak var foodPic: UIImageView!

    @IBOutlet weak var foodCategoryHeight: NSLayoutConstraint!

    @IBOutlet weak var foodCategory: UITextField!
    
//    @IBOutlet weak var kolodaView: KolodaView!
    @IBOutlet weak var kView: KolodaView!
    
//    var swipeUp: UISwipeGestureRecognizer!
//    var swipeRight: UISwipeGestureRecognizer!
//    var swipeLeft: UISwipeGestureRecognizer!
    var track = 0
    var didSwipe = false
    var foodQ: Queue = Queue()
    
    var foodChoices = ["Chinese", "Mexican", "Italian", "Japanese", "Mediterranean", "French", "Thai", "Spanish", "Indian", "Greek", "BBQ", "Burgers", "Sandwich", "Seafood", "Pizza", "Steak"]
//    {
//        didSet{
//            if foodChoices.count == 2{
//                self.performSegue(withIdentifier: "finalChooser", sender: nil)
//            }
//        }
//    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        generateAnswer()
//        foodCounter.text = String(("Maybe: 0/16"))
//        deniedFoodCounter.text = String(("Rejected: 0/16"))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        resetChoices.isEnabled = false
        
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        
        
        // Do any additional setup after loading the view, typically from a nib.
//        DispatchQueue.main.async {
    
            for s in self.foodChoices {
                let item = foodObj(foodName: s, foodImage: UIImage(named: s)!)
                self.foodQ.enqueue(element: item)
                print("foodname = " + s)
                
            }
//        }
            
        print(foodQ)
        
        
        kView.dataSource = self
        kView.delegate = self
        
        foodCategory.text = foodQ.index(index: 0).foodName

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func swipeToUp() {
        if didSwipe == false {
            didSwipe = true
        
        }
        if CLLocationManager.locationServicesEnabled() {
            print ("Its all on")
        } else {
            if let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
                    let urlString = "http://maps.apple.com/?q=\(foodChoices[track])+food"
        //&sll=\(latitude),\(longitude)"
                    if let url = URL(string: urlString) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    //}
                }
            //}
        //}
        
    }
    
    @objc func swipedToRight() {
        if didSwipe == false {
            didSwipe = true
        }
        
//        generateAnswer()
        //print (index)
        // Increment the index
//        lastChoice = Choice(operation:.right, value: nil)
        //currIndex += 1
        
        //FIXME: fix this
//        if approvedCounterIndex + deniedCounterIndex < 16 {
//                approvedCounterIndex += 1
//        }
//        track += 1
        DispatchQueue.main.async {
            let temp = self.foodQ.dequeue()
            self.foodQ.enqueue(element: temp!)
        }
        
//        print("Swiped Left on Food Choices: \(foodQ)")

        resetChoices.isEnabled = false
//        foodCounter.text = String(("Maybe: \(approvedCounterIndex)/16"))
        
    }
    
    
    
    @objc func swipedToLeft() {
        
        if didSwipe == false {
            didSwipe = true
        }
       
//        track += 1
        var out = foodQ.dequeue()
        resetChoices.isEnabled = true
//        kView.reloadData()
//        deniedFoodCounter.text = String(("Rejected: \(deniedCounterIndex)/16"))
//        foodCounter.text = String(("Maybe: \(approvedCounterIndex)/16"))

//        print("Swiped Left on Food Choices: \(foodQ)")
        
        // FIXME: get the index value and pass it in
//        index -= 1
        
//        generateAnswer()
        
        
        // Set the max index again
        // Get the currentIndex
        // Increment the index Set the current index value
    }
    

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        switch identifier {
        case "finalChooser":
            let destination = segue.destination as! finalFoodChooserViewController
            destination.foodArray = self.foodChoices
        default:
            print("that didn't work")
        }
        
    }
}
extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        
        koloda.reloadData()
        
        
    }

//    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
//        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
//    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if (direction.rawValue == "left" || direction.rawValue == "topLeft" || direction.rawValue == "bottomLeft") {
//            print("LEFT")
            
            swipedToLeft()
            print("Food count:" + String(foodQ.size()))
        } else if (direction.rawValue == "right" || direction.rawValue == "topRight" || direction.rawValue == "bottomRight") {
//            print("RIGHT")
            
            swipedToRight()
            print("Food count:" + String(foodQ.size()))
        } else {
            print("NEITHER")
        }
    }
}

extension ViewController: KolodaViewDataSource {

    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
//        if (kView.currentCardIndex == foodQ.size() - 1) {
////            koloda.reloadData()
//            track = 0
//        }
        print("NUMBER OF CARDS: " + (String)(foodQ.size()))
        return 150
    }


    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
//        generateAnswer()
        
//        if (index >= foodQ.size()) {
//
//            print ("ERROR HERE")
//            koloda.reloadData()
//
//            print(track)
//            track = 0
//
//            return UIImageView(image: foodQ.index(index: 0).foodImage)
//        } else {
//            print(track)
//            print("--------")
//            print(track)
        track = index
        if (foodQ.size() <= track) {
            track = 0
            
        }
        
           
        return UIImageView(image: foodQ.index(index: track).foodImage)
//        }
        
        
    }

}



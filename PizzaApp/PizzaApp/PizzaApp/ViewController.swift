//
//  ViewController.swift
//  PizzaApp
//
//  Created by user213523 on 2/18/22.
//

import UIKit

class ViewController: UIViewController {
    var pizzaList=[Pizza]()
    var toppingPrice=[UIButton:Double]()
    var originalPrice=0.0

    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var pizzaQty: UITextField!
    @IBOutlet weak var shrimp: UIButton!
    @IBOutlet weak var mushroom: UIButton!
    @IBOutlet weak var beef: UIButton!
    @IBOutlet weak var tomato: UIButton!
    @IBOutlet weak var pineapple: UIButton!
    @IBOutlet weak var pepperoni: UIButton!
    @IBOutlet weak var olive: UIButton!
    @IBOutlet weak var chicken: UIButton!
    @IBOutlet weak var largeSize: UIButton!
    @IBOutlet weak var mediumSize: UIButton!
    @IBOutlet weak var smallSize: UIButton!
    @IBOutlet weak var pizzaPrice: UILabel!
    @IBOutlet weak var pizzaName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        smallSize.isSelected = true
        
        fillData()
    }
    
    func fillData(){
        pizzaList.append(Pizza(name: "Cheese", price: 9.99, image: "cheese"))
        pizzaList.append(Pizza(name: "Meat", price: 10.5, image: "meat"))
        pizzaList.append(Pizza(name: "Margherita", price: 11.75, image: "margherita"))
        pizzaList.append(Pizza(name: "Pepperoni", price: 10.99, image: "pepperoni"))
        pizzaList.append(Pizza(name: "Veggie", price: 8.99, image: "veggie"))
        pizzaList.append(Pizza(name: "BBQ", price: 11.5, image: "bbq"))
        pizzaList.append(Pizza(name: "Hawaiian", price: 11.99, image: "hawaiian"))
    }
    

    @IBAction func findPizza(_ sender: Any) {
        let name=pizzaName.text?.lowercased()
        let obj=getPizza(name: name!)
        originalPrice=obj!.price
        pizzaPrice.text=String(format: "%.2f", originalPrice)
        pizzaImage.image=UIImage(named: obj!.image)
        changeSize(smallSize)
    }
    @IBAction func changeSize(_ sender: UIButton) {
        sender.isSelected=true
        if sender==smallSize{
            mediumSize.isSelected=false
            largeSize.isSelected=false
            pizzaPrice.text=String(format: "%.2f", originalPrice)
        }else if sender==mediumSize{
            smallSize.isSelected=false
            largeSize.isSelected=false
            pizzaPrice.text=String(format: "%.2f", originalPrice*1.5)
        }else if sender==largeSize{
            smallSize.isSelected=false
            mediumSize.isSelected=false
            pizzaPrice.text=String(format: "%.2f", originalPrice*2)
        }
    }
    @IBAction func selectTopping(_ sender: UIButton) {
        var currentPrice=Double(pizzaPrice.text!)!
        if sender.isSelected
        {
            sender.isSelected = false
            if sender==chicken || sender==olive || sender==pepperoni || sender==pineapple || sender==tomato || sender==beef || sender==mushroom || sender==shrimp
            {
                currentPrice-=0.75
            }
        }
        
        else
        {
            sender.isSelected = true
            if sender==chicken || sender==olive || sender==pepperoni || sender==pineapple || sender==tomato || sender==beef || sender==mushroom || sender==shrimp
            {
                currentPrice+=0.75
            }
        }
        
        pizzaPrice.text=String(currentPrice)
        
        
       
        //changes the sender (check box) state
        //sender.isSelected = !sender.isSelected
    }
    @IBAction func changeQty(_ sender: UIStepper) {
        pizzaQty.text=String(sender.value)
    }
    @IBAction func order(_ sender: UIButton) {
        let pizaQty=Double(pizzaQty.text!)!
        let currentPrice=Double(pizzaPrice.text!)!
        let total=pizaQty*currentPrice
        finalPrice.text=String(format: "%.2f", total)
    }
    
    func getPizza(name:String)->Pizza!
    {
        for pizza in pizzaList{
            if pizza.name.lowercased() == name{
                return pizza
            }
        }
        return nil
    }
    
    
}


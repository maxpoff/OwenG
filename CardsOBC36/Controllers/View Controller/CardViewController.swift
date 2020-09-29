//
//  CardViewController.swift
//  CardsOBC36
//
//  Created by Owen Gaudio on 9/29/20.
//  Copyright © 2020 Owen Gaudio. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    //MARK: - Objects
    @IBOutlet weak var suitNameLabel: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    
    //MARK: - LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCards()
    }
    
    //MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        self.fetchCards()
    }
    
    //MARK: - Helper Functions
    func updateViews(card: Card, image: UIImage) {
        self.cardImage.image = image
        self.suitNameLabel.text = card.suit
    }

    func fetchCards() {
        CardController.drawANewCard(1) { (cards, error) in

              if let cards = cards {
                CardController.fetchImage(cards[0]) { (image) in
                      DispatchQueue.main.async {
                          if let image = image {
                              self.updateViews(card: cards[0], image: image)
                          }
                      }
                  }
              }
          }
      }
}

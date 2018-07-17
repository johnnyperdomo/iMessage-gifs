//
//  MessagesViewController.swift
//  iMessage-gifs MessagesExtension
//
//  Created by Johnny Perdomo on 7/16/18.
//  Copyright © 2018 Johnny Perdomo. All rights reserved.
//

import UIKit
import Messages
import Alamofire
import SwiftyJSON
import SwiftGifOrigin


class MessagesViewController: MSMessagesAppViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var gifCollectionView: UICollectionView!
    
    var gifImageUrls = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifCollectionView.delegate = self
        gifCollectionView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getTrendingGifs { (success) in
            if success {
                
                print("gif success: \(self.gifImageUrls.count) images parsed")
                
                self.gifCollectionView.reloadData()
                
            }
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

    
}

extension MessagesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = gifCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell()}
        

        if  gifImageUrls.count > 0 {
            print("\(gifImageUrls.count) gifs downloaded")
            cell.gifImage.image = UIImage.gif(url: gifImageUrls[indexPath.row])
        } else {
            print("loading")
        }
        
        
        return cell

    }
}


extension MessagesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = gifCollectionView.frame.size.width
        
        return CGSize(width: width * 0.31, height: 100)
        
    }

}

extension MessagesViewController {
    
    func getTrendingGifs(complete: @escaping (_ status: Bool) -> ()) {
        
        Alamofire.request("https://api.giphy.com/v1/gifs/trending?api_key=IXGWPBvtve6E1k4gqR0X50AUKs9TI89E&limit=25&rating=G", method: .get).responseJSON { (response) in
            
            guard let value = response.result.value else { return }
            
            let json = JSON(value)
            
            for item in json["data"].arrayValue {
                
                let imagesArray = item["images"]["fixed_height_small"]["url"].stringValue
                self.gifImageUrls.append(imagesArray)
            }
            
            complete(true)
        }
    }
    
    
}





//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Lance Robbins on 11/28/17.
//  Copyright © 2017 Appcation. All rights reserved.
//

/* When working with table views need the following:
    * IBOutlet to the table view
    * UITableViewDelegate and UITableViewDataSource protocols
    * Implement at minimum these two methods:
        * cellForRowAt
        * numberofRowsInSection
    * set table view delegate and datasource to self so it knows what to call!
 
 */

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // IBOutlets
    // weak beacuse the UI already has a strong reference to this, if it were not weak, could run into a memory leak down the road. additional references need to be weak for this reason
    @IBOutlet weak var tableView: UITableView!
    
    
    // class variables
    
    var partyRocks = [PartyRock]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         // let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ev4bY1SkZLg\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p1 = PartyRock(imageURL: "https://s3.amazonaws.com/n1media1.images1.jamspiritsites.com/84968/148301860054ef9dad31694.jpg", videoURL: "<iframe src=\"https://player.vimeo.com/video/82975224\" width=\"640\" height=\"360\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>", videoTitle: "ABC")

        let p2 = PartyRock(imageURL: "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1w9DiGlZksU\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        
        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/2wUxw6GH3IM/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vg_nvEGryA4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lesson")
        
        let p4 = PartyRock(imageURL: "http://www.billboard.com/files/styles/article_main_image/public/media/lmfao-party-rock-anthem-2011-billboard-650.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gZIqW92GaTQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")
        
        let p5 = PartyRock(imageURL: "http://direct-ns.rhap.com/imageserver/v2/albums/Alb.219913217/images/600x600.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)

        

        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // Required protocols of table view
    
    // recycle cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // ask table view for party cell, and if it doesn't have one, 
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            
            // grab the party rock to update with
            let partyRock = partyRocks[indexPath.row]
            
            // update UI
            cell.updateUI(partyRock: partyRock)
            
            // return cell when done
            return cell
            } else {
            // return generic if PartyCell not found
            return UITableViewCell()
        }
    }
    
    // how many rows you want in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    // End required protocols table view
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
         
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }
    
    
    

  


}


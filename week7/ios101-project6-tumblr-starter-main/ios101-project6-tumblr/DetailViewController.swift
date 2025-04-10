//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Hoonsun Lee on 4/10/25.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {

    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var posterImageView: UIImageView!
    var post: Post!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        // Remove HTML tags from the caption string
        captionTextView.text = post.caption.trimHTMLTags()
        if let posterPath = post.photos.first{
            let photoURL = posterPath.originalSize.url
            Nuke.loadImage(with: photoURL, into: posterImageView)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

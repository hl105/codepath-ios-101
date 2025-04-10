//
//  DetailViewController.swift
//  ios101-lab6-flix
//
//  Created by Hoonsun Lee on 4/9/25.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var backdropImageView: UIImageView!
    
    var movie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        
        // unwrap optional vote average
        if let voteAverage = movie.voteAverage {
            //voteAverage is Double
            // we convert it to string using string interpolation
            voteLabel.text = "voteAverage: \(voteAverage)"
        }  else {
            voteLabel.text = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium // .short, .long, .full
        if let releaseDate = movie.releaseDate {
            let releaseDateString = dateFormatter.string(from: releaseDate)
            releaseDateLabel.text = "Release Date: \(releaseDateString)"
        } else {
            releaseDateLabel.text = ""
        }
        
        
        // Unwrap the optional poster path
        if let posterPath = movie.posterPath,

        // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {

            // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
            Nuke.loadImage(with: imageUrl, into: posterImageView)
        }

        // Unwrap the optional backdrop path
        if let backdropPath = movie.backdropPath,

        // Create a url by appending the backdrop path to the base url. https://developers.themoviedb.org/3/getting-started/images
        let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath) {

            // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
            Nuke.loadImage(with: imageUrl, into: backdropImageView)
        }

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

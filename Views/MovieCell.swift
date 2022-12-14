//
//  MovieCell.swift
//  MovieSelector
//
//  Created by Zardasht on 10/16/22.
//

import UIKit

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureMovieCell(movie:Movie) {
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.relaseDate
    }

}

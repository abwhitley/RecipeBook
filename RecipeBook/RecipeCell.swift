//
//  RecipeCell.swift
//  RecipeBook
//
//  Created by Austins Work on 10/18/16.
//  Copyright © 2016 AustinsIronYard. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell{
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pictureView: UIImageView!

    @IBOutlet var spinner: UIActivityIndicatorView!
    var recipeID: Int? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateWithTitle(nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        updateWithTitle(nil)
    }
    
    func updateWithTitle(_ title: String?) {
        if let recipeToDisplay = title {
            spinner.stopAnimating()
            titleLabel.text = recipeToDisplay
        }
        else {
            spinner.startAnimating()
            titleLabel.text = nil
        }
    }
    func updateWithImage(_ image: UIImage?){
        if let imageToDisplay = image{
            pictureView?.image = imageToDisplay
        }else{
            pictureView?.image = nil
        }
    }

}

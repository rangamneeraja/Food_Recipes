//
//  ProductTableViewCell.swift
//  Food_Recipes
//
//  Created by Rexel_Neeraja on 06/05/21.
//

import UIKit
import Foundation

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPhotoCellWith(product: Product) {
        
        DispatchQueue.main.async {
            self.idLabel.text = product.id
            self.titleLabel.text = product.title
            if let url = product.image {
                self.picture.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "placeholder"))
            }
        }
    }
    
}

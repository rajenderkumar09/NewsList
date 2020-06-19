//
//  ArticleCell.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//

import UIKit
import SDWebImage
import Localize_Swift


class ArticleCell: UITableViewCell {

	var articleViewModel:ArticleViewModel! {
		didSet {

			//Top bottom constraints
			let authorStackBottomMargin = self.contentView.constraints.first { (constraint) -> Bool in
				return constraint.identifier == "AuthorStackBottomMargin"
			}
			let authorStackTopMargin = self.contentView.constraints.first { (constraint) -> Bool in
				return constraint.identifier == "AuthorStackTopMargin"
			}

			//Set title label text
			titleLabel.text = "Title:".localized()
			authorLabel.text = "Author:".localized()
			descriptionLabel.text = "Description:".localized()

			titleTextLabel.text = articleViewModel.title
			if let author = articleViewModel.author {

				//Set top bottom margin of author stack view
				authorStackTopMargin?.constant = 8
				authorStackBottomMargin?.constant = 8

				//Unhide author Label and authou text label if author name is not null/blank
				authorLabel.isHidden = false
				authorTextLabel.isHidden = false

				authorTextLabel.text = author
			} else {

				//Set top margin of author stack view to 0 and keep bottom margin as it is, as we need some vertical space between title and description stack views
				authorStackTopMargin?.constant = 0
				authorStackBottomMargin?.constant = 8

				//Hide author Label and authou text label if author name is blank/null
				authorLabel.isHidden = true
				authorTextLabel.isHidden = true
			}
			descriptionTextLabel.text = articleViewModel.description

			//Check for image path and show image
			if let imagePath = articleViewModel.imagePath, let imageURL = URL(string: imagePath) {
				articleImageView.sd_setImage(with: imageURL) { (image, error, cache, url) in
					if let err = error {
						print("Error: \(err.localizedDescription)")
					}
				}
			}
		}
	}

	@IBOutlet weak var articleImageView: UIImageView! {
		didSet {
			articleImageView.clipsToBounds = true
			articleImageView.contentMode = .scaleAspectFit
		}
	}
	@IBOutlet weak var titleLabel: UILabel! {
		didSet {
			titleLabel.textAlignment = .right
			titleLabel.textColor = .black
			titleLabel.font = UIFont.appFont(with: .semibold, size: 15)
			titleLabel.numberOfLines = 1
		}
	}

	@IBOutlet weak var authorLabel: UILabel!{
		didSet {
			authorLabel.textAlignment = .right
			authorLabel.textColor = .black
			authorLabel.font = UIFont.appFont(with: .semibold, size: 15)
			authorLabel.numberOfLines = 1
		}
	}
	@IBOutlet weak var descriptionLabel: UILabel!{
		didSet {
			descriptionLabel.textAlignment = .right
			descriptionLabel.textColor = .black
			descriptionLabel.font = UIFont.appFont(with: .semibold, size: 15)
			descriptionLabel.numberOfLines = 1
		}
	}

	@IBOutlet weak var titleTextLabel: UILabel!{
		didSet {
			titleTextLabel.text = ""
			titleTextLabel.textColor = .darkGray
			titleTextLabel.font = UIFont.appFont(with: .regular, size: 15)
			titleTextLabel.numberOfLines = 0
		}
	}
	@IBOutlet weak var authorTextLabel: UILabel!{
		didSet {
			authorTextLabel.text = ""
			authorTextLabel.textColor = .darkGray
			authorTextLabel.font = UIFont.appFont(with: .regular, size: 15)
			authorTextLabel.numberOfLines = 0
		}
	}
	@IBOutlet weak var descriptionTextLabel: UILabel!{
		didSet {
			descriptionTextLabel.text = ""
			descriptionTextLabel.textColor = .darkGray
			descriptionTextLabel.font = UIFont.appFont(with: .regular, size: 15)
			descriptionTextLabel.numberOfLines = 0
		}
	}

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

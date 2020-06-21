//
//  PhotoTableViewCell.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

import UIKit
import Nuke

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.width / 2
            thumbnailImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet var titleLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
        thumbnailImageView.image = nil
    }

    func configure(photo: Photo) {
        titleLabel.text = photo.title
        loadImage(path: photo.thumbnailUrl)
    }
}

// MARK: Helpers
extension PhotoTableViewCell {

    func loadImage(path: String) {
        guard let placeholderImage = R.image.icons8Camera503() else { return assertionFailure() }
        guard let imageURL = URL(string: path) else { return assertionFailure() }

        let options = ImageLoadingOptions(
            placeholder: placeholderImage,
            transition: .fadeIn(duration: 0.2),
            failureImage: placeholderImage,
            failureImageTransition: .fadeIn(duration: 0.2),
            contentModes: nil)

        Nuke.loadImage(with: imageURL, options: options, into: thumbnailImageView)
    }
}

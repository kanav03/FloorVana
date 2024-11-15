import UIKit

class myProjectCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Configure imageView
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        // Configure delete button
        deleteButton.isHidden = true
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.systemRed, for: .normal)
        deleteButton.backgroundColor = .clear
        deleteButton.layer.cornerRadius = 5
        deleteButton.clipsToBounds = true
    }

    // Method to show or hide the delete button based on edit mode
    func toggleEditMode(_ isEditing: Bool) {
        deleteButton.isHidden = !isEditing
    }
}


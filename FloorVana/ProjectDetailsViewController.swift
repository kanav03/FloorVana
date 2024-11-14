import UIKit

class ProjectDetailsViewController: UIViewController {


    @IBOutlet weak var projectImageView: UIImageView!
    @IBOutlet weak var createdOnLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var bedroomCountLabel: UILabel!
    @IBOutlet weak var kitchenCountLabel: UILabel!
    @IBOutlet weak var bathroomCountLabel: UILabel!
    @IBOutlet weak var livingRoomCountLabel: UILabel!
    @IBOutlet weak var diningRoomCountLabel: UILabel!
    @IBOutlet weak var studyRoomCountLabel: UILabel!
    @IBOutlet weak var entryCountLabel: UILabel!
    @IBOutlet weak var vastuLabel: UILabel!
    @IBOutlet weak var exportButton: UIButton!
    
    @IBOutlet weak var Segment2dto3d: UISegmentedControl!
    
    // Variable to hold data passed from My Projects gallery
    var projectData: DataModelMyProject.ProjectDetails?
   // private var imageDataModel: Display3dDataModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageDataModel = Display3dDataModel.fetchImageData()
//        
//        // Set initial image to 3D
//        projectImageView.image = UIImage(named: imageDataModel.image3DName)
//        
//        // Add target for segmented control changes
//        Segment2dto3d.addTarget(self, action: #selector(getter: Segment2dto3d), for: .valueChanged)
//        func segmentChanged() {
//            // Update image based on selected segment
//            switch Segment2dto3d.selectedSegmentIndex {
//            case 0:
//                // Set image to 3D
//                projectImageView.image = UIImage(named: imageDataModel.image3DName)
//            case 1:
//                // Set image to 2D
//                projectImageView.image = UIImage(named: imageDataModel.image2DName)
//            default:
//                break
//            }
//        }
        // Ensure projectData is not nil before using it
        guard let project = projectData else { return }
        
        
        projectImageView.image = UIImage(named: project.imageName)
        createdOnLabel.text = "Created on: \(project.createdOn)"
        areaLabel.text = "\(project.area)"
        bedroomCountLabel.text = "\(project.bedrooms)"
        kitchenCountLabel.text = "\(project.kitchen)"
        bathroomCountLabel.text = "\(project.bathrooms)"
        livingRoomCountLabel.text = "\(project.livingRoom)"
        diningRoomCountLabel.text = "\(project.diningRoom)"
        studyRoomCountLabel.text = "\(project.studyRoom)"
        entryCountLabel.text = "\(project.entry)"
        vastuLabel.text = "\(project.vastu)"
        

        
        /*exportButton.isEnabled = project.exportAvailable*/
    }
}

import UIKit

class HouseSpecificationsViewController: UIViewController {
    
    // Outlets for room count labels
    @IBOutlet weak var bedroomCountLabel: UILabel!
    @IBOutlet weak var kitchenCountLabel: UILabel!
    @IBOutlet weak var bathroomCountLabel: UILabel!
    @IBOutlet weak var livingRoomCountLabel: UILabel!
    @IBOutlet weak var dinningRoomCountLabel: UILabel!
    @IBOutlet weak var studyRoomCountLabel: UILabel!
    @IBOutlet weak var entryCountLabel: UILabel!
    
    // Outlets for steppers
    @IBOutlet weak var bedroomStepper: UIStepper!
    @IBOutlet weak var kitchenStepper: UIStepper!
    @IBOutlet weak var bathroomStepper: UIStepper!
    @IBOutlet weak var livingRoomStepper: UIStepper!
    @IBOutlet weak var dinningRoomStepper: UIStepper!
    @IBOutlet weak var studyRoomStepper: UIStepper!
    @IBOutlet weak var entryStepper: UIStepper!
    
    // Outlet for total area text field and Vastu compliance switch
    
    @IBOutlet weak var areaTextField: UITextField!
    @IBOutlet weak var vastuSwitch: UISwitch!
    
    // Outlet for build button
    @IBOutlet weak var buildButton: UIButton!
    
    // HouseSpecifications model
    private var model: HouseSpecifications!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the model
        model = HouseSpecifications()
        
        // Setup initial UI values and configure UI
        setupInitialValues()
        configureUI()
        
        // Dismiss keyboard when tapping outside text fields
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupInitialValues() {
        // Set minimum and maximum values for steppers
        [bedroomStepper, kitchenStepper, bathroomStepper, livingRoomStepper,
         dinningRoomStepper, studyRoomStepper, entryStepper].forEach { stepper in
            stepper?.minimumValue = 0
            stepper?.maximumValue = 10
            stepper?.value = 0
        }
        
        // Clear area text field
        areaTextField.text = ""
        
        // Update UI with values from the model
        updateUIFromModel()
    }
    
    private func updateUIFromModel() {
        // Set labels with room counts from the model
        bedroomCountLabel.text = "\(model.getRoomCount(for: .bedroom))"
        kitchenCountLabel.text = "\(model.getRoomCount(for: .kitchen))"
        bathroomCountLabel.text = "\(model.getRoomCount(for: .bathroom))"
        livingRoomCountLabel.text = "\(model.getRoomCount(for: .livingRoom))"
        dinningRoomCountLabel.text = "\(model.getRoomCount(for: .dinningRoom))"
        studyRoomCountLabel.text = "\(model.getRoomCount(for: .studyRoom))"
        entryCountLabel.text = "\(model.getRoomCount(for: .entry))"
        
        // Set the area text field with the total area from the model
        areaTextField.text = model.totalArea > 0 ? "\(model.totalArea)" : ""
        
        // Set the Vastu compliance switch state
        vastuSwitch.isOn = model.isVastuCompliant
    }
    
    private func configureUI() {
        // Style the build button
        buildButton.layer.cornerRadius = 12
        buildButton.backgroundColor = .black
        buildButton.setTitleColor(.yellow, for: .normal)
        
        // Set keyboard type for area text field
        areaTextField.keyboardType = .numberPad
        areaTextField.delegate = self
    }
    
    // Action for room count steppers
    @IBAction func bedroomStepperChanged(_ sender: UIStepper) {
           model.updateRoomCount(for: .bedroom, count: Int(sender.value))
           bedroomCountLabel.text = "\(Int(sender.value))"
       }
       
       @IBAction func kitchenStepperChanged(_ sender: UIStepper) {
           model.updateRoomCount(for: .kitchen, count: Int(sender.value))
           kitchenCountLabel.text = "\(Int(sender.value))"
       }
       
       @IBAction func bathroomStepperChanged(_ sender: UIStepper) {
           model.updateRoomCount(for: .bathroom, count: Int(sender.value))
           bathroomCountLabel.text = "\(Int(sender.value))"
       }
       
       @IBAction func livingRoomStepperChanged(_ sender: UIStepper) {
           model.updateRoomCount(for: .livingRoom, count: Int(sender.value))
           livingRoomCountLabel.text = "\(Int(sender.value))"
       }
       
       @IBAction func dinningRoomStepperChanged(_ sender: UIStepper) {
           model.updateRoomCount(for: .dinningRoom, count: Int(sender.value))
           dinningRoomCountLabel.text = "\(Int(sender.value))"
       }
       
       @IBAction func studyRoomStepperChanged(_ sender: UIStepper) {
           model.updateRoomCount(for: .studyRoom, count: Int(sender.value))
           studyRoomCountLabel.text = "\(Int(sender.value))"
       }
       
       @IBAction func entryStepperChanged(_ sender: UIStepper) {
           model.updateRoomCount(for: .entry, count: Int(sender.value))
           entryCountLabel.text = "\(Int(sender.value))"
       }
       
       @IBAction func vastuSwitchChanged(_ sender: UISwitch) {
           model.setVastuCompliance(sender.isOn)
       }
       
    @IBAction func buildButtonTapped(_ sender: UIButton) {
            // Update the total area from the area text field
            if let areaValue = Int(areaTextField.text ?? "0") {
                model.updateTotalArea(area: areaValue)
            }
            
        
        // Validate the model and show alert if invalid
        if model.validate() {
            print("House specifications are valid")
            let specifications = model.toDictionary()
            print("Final Specifications:", specifications)
            print("Total Rooms:", model.totalRooms)
            print("Total Area:", model.totalArea)
        } else {
            let alert = UIAlertController(
                title: "Invalid Specifications",
                message: "Please ensure you have at least one bedroom, kitchen, and bathroom, and the total area is greater than 0.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}

// UITextFieldDelegate extension for handling area text field input
extension HouseSpecificationsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == areaTextField, let value = Int(textField.text ?? "") {
            model.updateTotalArea(area: value)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Only allow numeric input in the area text field
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

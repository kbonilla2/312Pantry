//
//  CreateVC.swift
//  correctECCedit
//
//  Created by Xcode on 7/28/21.
//

import UIKit

class CreateVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var uploadTitle: UILabel!
    @IBOutlet weak var subtitleText: UILabel!
    
    @IBOutlet weak var optionsLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet weak var optionsTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var locationNameTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    let options = ["Add Community Pantry", "Add Community Fridge", "Add Volunteer Opportunity"]
    
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subtitleText.text = "Upload locations of fridges, pantries, and volunteer opporunities that are not listed on the app."
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        optionsTextField.inputView = pickerView
        optionsTextField.textAlignment = .center
        
    }
    
    @IBAction func didTapButton() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "confirmVC") as! ConfirmViewController
        present(vc, animated: true)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        options[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        optionsTextField.text = options[row]
        optionsTextField.resignFirstResponder()
    }
    
    //adding photo from camera roll
    @IBAction func buttonTapped(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func camerButtonTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationBarDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    //allow to take photo from camera
    func imagePickerControllerCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControl(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        
        picker.dismiss(animated: true, completion: nil)
        
        guard (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) != nil else {
            return
        }
    }
    
}


//
//  UserDefinedViewController.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/11/23.
//


import UIKit

class UserDefinedViewController: UIViewController {
  
  var sharedView = SharedView()
  var rgbView = RGBView()
  var hexView = HexView()
  //  var pickerView = UIPickerView()
  var cmykView = CMYKView()
  
  let infoStack = UIStackView()
  
  var definedColor: Color?
  
  var viewModel = UserDefinedViewModel()
  
  override func viewWillAppear(_ animated: Bool) {
    rgbView.isHidden = false
    hexView.isHidden = true
    cmykView.isHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
    
    sharedView.segController.selectedSegmentIndex = 0
    viewModel.sharedView = self.sharedView
    viewModel.segControl = sharedView.segController
    
    viewModel.rgbView = self.rgbView
    viewModel.hexView = self.hexView
    viewModel.cmykView = self.cmykView
    
    viewModel.activateSharedInputs()
    viewModel.activateRGBInputs()
    viewModel.activateHexInputs()
    viewModel.activateCMYKInputs()
  }
}

extension UserDefinedViewController {
  
  func style() {
    sharedView.translatesAutoresizingMaskIntoConstraints = false
    rgbView.translatesAutoresizingMaskIntoConstraints = false
    rgbView.redTextField.delegate = self
    rgbView.greenTextField.delegate = self
    rgbView.blueTextField.delegate = self
    
    hexView.translatesAutoresizingMaskIntoConstraints = false
    hexView.hexTextField.delegate = self
    
    cmykView.translatesAutoresizingMaskIntoConstraints = false
    cmykView.cyanTextField.delegate = self
    cmykView.magentaTextField.delegate = self
    cmykView.yellowTextField.delegate = self
    cmykView.keyTextField.delegate = self
    
    
    infoStack.translatesAutoresizingMaskIntoConstraints = false
    infoStack.axis = .vertical
    infoStack.spacing = 16
  }
  
  func layout() {
    view.addSubview(sharedView)
    NSLayoutConstraint.activate([
      sharedView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
      sharedView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: sharedView.trailingAnchor, multiplier: 4)
    ])
    
    view.addSubview(rgbView)
    NSLayoutConstraint.activate([
      rgbView.topAnchor.constraint(equalToSystemSpacingBelow: sharedView.bottomAnchor, multiplier: 1),
      rgbView.leadingAnchor.constraint(equalTo: sharedView.leadingAnchor),
      rgbView.trailingAnchor.constraint(equalTo: sharedView.trailingAnchor),
      rgbView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    view.addSubview(hexView)
    NSLayoutConstraint.activate([
      hexView.topAnchor.constraint(equalToSystemSpacingBelow: sharedView.bottomAnchor, multiplier: 1),
      hexView.leadingAnchor.constraint(equalTo: sharedView.leadingAnchor),
      hexView.trailingAnchor.constraint(equalTo: sharedView.trailingAnchor),
      hexView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    
    view.addSubview(cmykView)
    NSLayoutConstraint.activate([
      cmykView.topAnchor.constraint(equalToSystemSpacingBelow: sharedView.bottomAnchor, multiplier: 1),
      cmykView.leadingAnchor.constraint(equalTo: sharedView.leadingAnchor),
      cmykView.trailingAnchor.constraint(equalTo: sharedView.trailingAnchor),
      cmykView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension UserDefinedViewController: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    guard let value = Int(textField.text!) else { return }
    switch textField.accessibilityLabel {
      case TextFields.redTextField.rawValue:
        rgbView.redValue = CGFloat(value)
        rgbView.redSlider.value = Float(value)
      case TextFields.greenTextField.rawValue:
        rgbView.greenValue = CGFloat(value)
        rgbView.greenSlider.value = Float(value)
      case TextFields.blueTextField.rawValue:
        rgbView.blueValue = CGFloat(value)
        rgbView.blueSlider.value = Float(value)
        
      case TextFields.hexTextField.rawValue:
        print("\(value)")
        
      case TextFields.cyanTextField.rawValue:
        cmykView.cyanValue = CGFloat(value)
        cmykView.cyanSlider.value = Float(value)
      case TextFields.magentaTextField.rawValue:
        cmykView.magentaValue = CGFloat(value)
        cmykView.magentaSlider.value = Float(value)
      case TextFields.yellowTextField.rawValue:
        cmykView.yellowValue = CGFloat(value)
        cmykView.yellowSlider.value = Float(value)
      case TextFields.keyTextField.rawValue:
        cmykView.keyValue = CGFloat(value)
        cmykView.keySlider.value = Float(value)
      default:
        break
    }
  }
}


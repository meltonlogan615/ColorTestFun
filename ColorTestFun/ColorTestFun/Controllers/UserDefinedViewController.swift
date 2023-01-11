//
//  UserDefinedViewController.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/11/23.
//


import UIKit

enum DefinedViews: String, CaseIterable {
  case rgb
  case hex
  case picker
}

class UserDefinedViewController: UIViewController {

  let segController = UISegmentedControl(items: [
    DefinedViews.rgb.rawValue.localizedUppercase,
    DefinedViews.hex.rawValue.localizedUppercase,
    DefinedViews.picker.rawValue.localizedUppercase
  ])

  let rgbView = RGBView()
  let hexView = HexView()
  var rgbViewModel = RGBViewModel()
  
  override func viewWillAppear(_ animated: Bool) {
    hexView.isHidden = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    style()
    layout()
    self.segController.selectedSegmentIndex = 0
    rgbViewModel.segControl = segController
    rgbViewModel.sliderView = rgbView
    rgbViewModel.hexView = hexView
    rgbViewModel.activateInputs()
  }
}

extension UserDefinedViewController {

  func style() {
    segController.translatesAutoresizingMaskIntoConstraints = false
    segController.selectedSegmentIndex = 0
    segController.backgroundColor = .systemBackground
    segController.selectedSegmentTintColor = rgbViewModel.definedColor

    rgbView.translatesAutoresizingMaskIntoConstraints = false
    hexView.translatesAutoresizingMaskIntoConstraints = false

  }

  func layout() {
    view.addSubview(segController)
    NSLayoutConstraint.activate([
      segController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      segController.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: segController.trailingAnchor, multiplier: 4)
    ])

    view.addSubview(rgbView)
    NSLayoutConstraint.activate([
      rgbView.topAnchor.constraint(equalToSystemSpacingBelow: segController.bottomAnchor, multiplier: 1),
      rgbView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      rgbView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      rgbView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    view.addSubview(hexView)
    NSLayoutConstraint.activate([
      hexView.topAnchor.constraint(equalToSystemSpacingBelow: segController.bottomAnchor, multiplier: 1),
      hexView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      hexView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      hexView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }

}


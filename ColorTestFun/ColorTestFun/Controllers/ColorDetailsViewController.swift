//
//  ColorDetailsViewController.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/10/23.
//


import UIKit

class ColorDetailsViewController: UIViewController {

  var detailsView = ColorDetailsView()
  var color: Color!

  let viewModel = ColorDetailsViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.tintColor = .label
    style()
    layout()
    viewModel.color = self.color
    viewModel.detailsView = detailsView
    viewModel.unwrapAndAssign()
    title = viewModel.colorName
  }
}

extension ColorDetailsViewController {
  func style() {
    detailsView.translatesAutoresizingMaskIntoConstraints = false
  }

  func layout() {
    view.addSubview(detailsView)
    NSLayoutConstraint.activate([
      detailsView.topAnchor.constraint(equalTo: view.topAnchor),
      detailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      detailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      detailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }
}

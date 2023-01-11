//
//  ViewController.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

class ColorListViewController: UIViewController {
  
  var colors = [Color]()
  let network = ColorGetter()
  var table = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.prefersLargeTitles = true
    colors = network.getColors()
    self.title = "Named Colors"
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    table.dataSource = self
    table.delegate = self
    view.addSubview(table)
    table.frame = view.frame
  }
}

extension ColorListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return colors.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let color = colors[indexPath.item]
    var config = cell.defaultContentConfiguration()
    config.text = color.name
    config.textProperties.font = .preferredFont(forTextStyle: .title2)
    cell.backgroundColor = color.uiColor
    cell.contentConfiguration = config
    cell.insetsLayoutMarginsFromSafeArea = true
    return cell
  }
}

extension ColorListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = ColorDetailsViewController()
    vc.color = colors[indexPath.item]
    navigationController?.show(vc, sender: true)
  }
}



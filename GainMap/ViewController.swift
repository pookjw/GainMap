//
//  ViewController.swift
//  GainMap
//
//  Created by Jinwoo Kim on 9/16/22.
//

import UIKit
import Combine

final class ViewController: UIViewController {
  private var stackView: UIStackView!
  private var normalView: UIView!
  private var gainFillView: GainMapView!
  private var gainBorderRenderFillView: GainMapView!
  private var tasks: [Task<Void, Never>] = []

  deinit {
    tasks.removeAll { task in
      task.cancel()
      return true
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white

    let stackView: UIStackView = .init()
    stackView.backgroundColor = .clear
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.spacing = 20.0
    stackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackView.widthAnchor.constraint(equalToConstant: 200.0),
      stackView.heightAnchor.constraint(equalToConstant: 340.0)
    ])

    let normalView: UIView = .init()
    normalView.backgroundColor = .black
    stackView.addArrangedSubview(normalView)
    applyCornerRadius(targetView: normalView)
    self.normalView = normalView

    let gainFillView: GainMapView = .init(frame: .null, renderMode: .gainFill)
    gainFillView.backgroundColor = .black
    stackView.addArrangedSubview(gainFillView)
    applyCornerRadius(targetView: gainFillView)
    self.gainFillView = gainFillView

    let gainBorderRenderFillView: GainMapView = .init(frame: .null, renderMode: .gainBorderRenderFill)
    gainBorderRenderFillView.backgroundColor = .black
    stackView.addArrangedSubview(gainBorderRenderFillView)
    applyCornerRadius(targetView: gainBorderRenderFillView)
    self.gainBorderRenderFillView = gainBorderRenderFillView
  }

  private func applyCornerRadius(targetView: UIView) {
    let task: Task<Void, Never> = Task { @MainActor [targetView] in
      for await _ in targetView.publisher(for: \.bounds, options: [.initial, .new]).values {
        targetView.layer.cornerRadius = targetView.frame.height / 2.0
      }
    }

    tasks.append(task)
  }
}

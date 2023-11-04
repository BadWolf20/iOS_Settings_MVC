//
//  DetailController.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit

class DetailController: UIViewController {

    // MARK: - Properties
    private let screenName: String
    private let detailedView = DetailedView()


    // MARK: - Initializers
    init(screenName: String) {
        self.screenName = screenName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailedView
        setup()
    }

    // MARK: - Setup
    private func setup() {
        setupComponents()
        setupText()
    }

    private func setupComponents() {
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    private func setupText() {
        title = screenName
    }

}

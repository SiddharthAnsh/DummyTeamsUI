//
//  SidebarViewController.swift
//  Project3
//
//  Created by Siddharth Ansh on 24/02/25.
//

import UIKit

class SidebarViewController: UIViewController {
    
    private let sidebarWidth: CGFloat = UIScreen.main.bounds.width * 0.8
    private var backgroundView: UIView!
    
    private let sidebarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: -2, height: 0)
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Avatar") // Replace with actual image
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Karin Blair"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let jobTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Software Engineer"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    
    private let signOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign out", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    private let signOutEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "karin.blair@northwindtrade.com"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    private let signOutImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Color") // Replace with actual image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var sidebarLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5) // Dim background
        
        setupSidebar()
        setupMenuItems()
        addGestureRecognizers()
    }
    
    @objc private func dismissSidebar() {
        UIView.animate(withDuration: 0.3, animations: {
            self.dismiss(animated: false)
        }) { _ in
            self.dismiss(animated: false)
        }
        }
    
    private func setupSidebar() {
        view.addSubview(sidebarView)
        
        sidebarView.translatesAutoresizingMaskIntoConstraints = false
        sidebarLeadingConstraint = sidebarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -sidebarWidth)
        
        NSLayoutConstraint.activate([
            sidebarLeadingConstraint,
            sidebarView.widthAnchor.constraint(equalToConstant: sidebarWidth),
            sidebarView.topAnchor.constraint(equalTo: view.topAnchor),
            sidebarView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Profile Section
        
        let textStackView = UIStackView(arrangedSubviews: [nameLabel, jobTitleLabel])
        textStackView.axis = .vertical
        textStackView.spacing = 4
        textStackView.alignment = .leading
            
            // Create a horizontal stack with image on the left, text on the right
        let profileStackView = UIStackView(arrangedSubviews: [profileImageView, textStackView])
        profileStackView.axis = .horizontal
        profileStackView.spacing = 12
        profileStackView.alignment = .center
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
            
            // Add profileStackView to sidebarView
        sidebarView.addSubview(profileStackView)
            
            // Apply constraints
        NSLayoutConstraint.activate([
            profileStackView.topAnchor.constraint(equalTo: sidebarView.topAnchor, constant: 40),
            profileStackView.leadingAnchor.constraint(equalTo: sidebarView.leadingAnchor, constant: 20),
            profileStackView.trailingAnchor.constraint(equalTo: sidebarView.trailingAnchor, constant: -20),

            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        sidebarView.addSubview(profileStackView)
        
        // Menu Items
        sidebarView.addSubview(menuStackView)
        menuStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuStackView.topAnchor.constraint(equalTo: profileStackView.bottomAnchor, constant: 30),
            menuStackView.leadingAnchor.constraint(equalTo: sidebarView.leadingAnchor, constant: 20),
            menuStackView.trailingAnchor.constraint(equalTo: sidebarView.trailingAnchor, constant: -20)
        ])
        
        
        let signOutTextStackView = UIStackView(arrangedSubviews: [signOutButton, signOutEmailLabel])
        signOutTextStackView.axis = .vertical
        signOutTextStackView.spacing = 4
        signOutTextStackView.alignment = .leading
        
        let signOutStackView = UIStackView(arrangedSubviews: [signOutImageView, signOutTextStackView])
        signOutStackView.axis = .horizontal
        signOutStackView.spacing = 12
        signOutStackView.alignment = .center
        signOutStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // Sign Out Button
        sidebarView.addSubview(signOutStackView)
        signOutStackView.`translatesAutoresizingMaskIntoConstraints` = false
        
        NSLayoutConstraint.activate([
            signOutImageView.widthAnchor.constraint(equalToConstant: 15),  // Adjust width
            signOutImageView.heightAnchor.constraint(equalToConstant: 15),
                                                         
            signOutStackView.bottomAnchor.constraint(equalTo: sidebarView.bottomAnchor, constant: -40),
            signOutStackView.leadingAnchor.constraint(equalTo: sidebarView.leadingAnchor, constant: 20)
        ])
    }
    
    private let menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16 // space between two cell
        stackView.alignment = .fill
        return stackView
    }()
    
    private func setupMenuItems() {
        let menuItems = [
            ("Available", "checkmark.circle"),
            ("Set status message", "pencil"),
            ("Notification", "bell"),
            ("Settings", "gearshape"),
            ("What's new", "lightbulb")
        ]
        
        for (index, item) in menuItems.enumerated() {
            let menuItem = createMenuItem(title: item.0, iconName: item.1)
            menuStackView.addArrangedSubview(menuItem)
            
            if index != menuItems.count - 1 { // add space to all cell except last cell
                let spacer = UIView()
                spacer.heightAnchor.constraint(equalToConstant: 12).isActive = true
                menuStackView.addArrangedSubview(spacer)
            }
        }
    }

    
    private func createMenuItem(title: String, iconName: String) -> UIView {
        let container = UIView() // Parent view for spacing
        
        let view = UIView()
        
        let imageView = UIImageView(image: UIImage(systemName: iconName))
        imageView.tintColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24),
            
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        container.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: container.topAnchor),
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12) // Adds space below
        ])
        
        return container
    }
    
    private func addGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSidebar))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    func toggleSidebar(show: Bool) {
        sidebarLeadingConstraint.constant = show ? 0 : -sidebarWidth
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}


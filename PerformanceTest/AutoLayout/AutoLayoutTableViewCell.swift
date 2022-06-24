//
//  AutoLayoutTableViewCell.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import UIKit

class AutoLayoutTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: AutoLayoutTableViewCell.self)

    private let bigLogoImageView = UIImageView()
    private let smallLogoImageView = UIImageView()
    
    private let topLeftLabel = UILabel()
    private let topRightLabel = UILabel()
    private let botLeftLabel = UILabel()
    private let botRightLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupInitialState()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: CellViewModel) {
        bigLogoImageView.image = UIImage(named: viewModel.bigLogo)
        smallLogoImageView.image = UIImage(named: viewModel.smallLogo)
        topLeftLabel.text = viewModel.topLeftText
        topRightLabel.text = viewModel.topRightText
        botLeftLabel.text = viewModel.botLeftText
        botRightLabel.text = viewModel.botRightText
    }
    
    private func setupInitialState() {
        contentView.backgroundColor = .white

        contentView.addSubview(bigLogoImageView)
        contentView.addSubview(smallLogoImageView)
        contentView.addSubview(topLeftLabel)
        contentView.addSubview(topRightLabel)
        contentView.addSubview(botLeftLabel)
        contentView.addSubview(botRightLabel)
        
        bigLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        smallLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        topLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        topRightLabel.translatesAutoresizingMaskIntoConstraints = false
        botLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        botRightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        topLeftLabel.numberOfLines = 1
        topRightLabel.numberOfLines = 1
        botLeftLabel.numberOfLines = 1
        botRightLabel.numberOfLines = 1
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            bigLogoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bigLogoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            bigLogoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            bigLogoImageView.widthAnchor.constraint(equalToConstant: 36),
            bigLogoImageView.heightAnchor.constraint(equalToConstant: 36),
            
            topRightLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            topRightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            smallLogoImageView.trailingAnchor.constraint(equalTo: topRightLabel.leadingAnchor, constant: -8),
            smallLogoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            smallLogoImageView.widthAnchor.constraint(equalToConstant: 18),
            smallLogoImageView.heightAnchor.constraint(equalToConstant: 18),
            
            botRightLabel.topAnchor.constraint(equalTo: topRightLabel.bottomAnchor, constant: 2),
            botRightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            topLeftLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            topLeftLabel.leadingAnchor.constraint(equalTo: bigLogoImageView.trailingAnchor, constant: 12),
            topLeftLabel.trailingAnchor.constraint(lessThanOrEqualTo: smallLogoImageView.leadingAnchor),

            botLeftLabel.topAnchor.constraint(equalTo: topLeftLabel.bottomAnchor, constant: 2),
            botLeftLabel.leadingAnchor.constraint(equalTo: bigLogoImageView.trailingAnchor, constant: 12),
            botLeftLabel.trailingAnchor.constraint(equalTo: botRightLabel.leadingAnchor)

        ])
    }
}

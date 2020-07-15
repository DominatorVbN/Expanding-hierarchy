//
//  OutlineViewController.swift
//  Expanding hierarchy (iOS)
//
//  Created by dominator on 16/07/20.
//

import UIKit

class OutlineViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Record>! = nil
    var outlineCollectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Outline View UIKit"
        configureCollectionView()
        configureDataSource()
    }

}
extension OutlineViewController {

    func configureCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemGroupedBackground
        self.outlineCollectionView = collectionView
        collectionView.delegate = self
    }

    func configureDataSource() {
        
        let containerCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Record> { (cell, indexPath, record) in
            // Populate the cell with our item description.
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = record.name
            contentConfiguration.textProperties.font = .preferredFont(forTextStyle: .headline)
            switch record.type{
            case .file:
                contentConfiguration.image = UIImage(systemName: "swift")
                cell.tintColor = .systemRed
            case .folder:
                contentConfiguration.image = UIImage(systemName: "folder.fill")
                cell.tintColor = .systemYellow
            case .package:
                contentConfiguration.image = UIImage(systemName: "shippingbox.fill")
                cell.tintColor = .systemTeal
            }
            cell.contentConfiguration = contentConfiguration
            
            let disclosureOptions = UICellAccessory.OutlineDisclosureOptions(style: .header)
            cell.accessories = [.outlineDisclosure(options:disclosureOptions)]
            cell.backgroundConfiguration = UIBackgroundConfiguration.clear()
        }
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Record> { cell, indexPath, record in
            // Populate the cell with our item description.
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = record.name
            switch record.type{
            case .file:
                contentConfiguration.image = UIImage(systemName: "swift")
                cell.tintColor = .systemRed
            case .folder:
                contentConfiguration.image = UIImage(systemName: "folder.fill")
                cell.tintColor = .systemYellow
            case .package:
                contentConfiguration.image = UIImage(systemName: "shippingbox.fill")
                cell.tintColor = .systemTeal
            }
            cell.contentConfiguration = contentConfiguration
            cell.backgroundConfiguration = UIBackgroundConfiguration.clear()
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, Record>(collectionView: outlineCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Record) -> UICollectionViewCell? in
            // Return the cell.
            if (item.subRecords ?? []).isEmpty {
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            } else {
                return collectionView.dequeueConfiguredReusableCell(using: containerCellRegistration, for: indexPath, item: item)
            }
        }

        // load our initial data
        let snapshot = initialSnapshot()
        self.dataSource.apply(snapshot, to: .main, animatingDifferences: false)
    }

    func generateLayout() -> UICollectionViewLayout {
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: listConfiguration)
        return layout
    }

    func initialSnapshot() -> NSDiffableDataSourceSectionSnapshot<Record> {
        var snapshot = NSDiffableDataSourceSectionSnapshot<Record>()

        func addItems(_ records: [Record], to parent: Record?) {
            snapshot.append(records, to: parent)
            for record in records where !(record.subRecords ?? []).isEmpty {
                addItems(record.subRecords ?? [], to: record)
            }
        }
        
        addItems(Record.mvvm, to: nil)
        return snapshot
    }

}

extension OutlineViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let record = self.dataSource.itemIdentifier(for: indexPath) else { return }
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        guard record.subRecords == nil || record.subRecords!.isEmpty else {
            return
        }
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TextViewController") as? TextViewController{
            vc.text = record.name
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}


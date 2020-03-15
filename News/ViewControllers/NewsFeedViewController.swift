//
//  ViewController.swift
//  News
//
//  Created by Evgeniy Opryshko on 13.03.2020.
//  Copyright © 2020 Evgeniy Opryshko. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {
	
    // MARK: - Private properties
	
	private var networking: Networking!
	private var fetcher: DataFetcher!
	private let searchController = UISearchController(searchResultsController: nil)
	
	private var newsFeed: NewsResponse?
	private var newsFeedViewModel = NewsFeedViewModel.init(cells: [])
	private var filteredNewsFeedViewModel = NewsFeedViewModel.init(cells: [])
	
	private var isSearchBarEmpty: Bool {
		return searchController.searchBar.text?.isEmpty ?? true
	}
	
	private var isFiltering: Bool {
		let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
		return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
	}
	
	private lazy var refreshControl: UIRefreshControl = {
		let refreshControl = UIRefreshControl()
		refreshControl.addTarget(self, action: #selector(didSwipeRefreshGroups), for: .valueChanged)
		return refreshControl
	}()
	
    // MARK: - IBOutlets
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
    // MARK: - View lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.networking = NetworkService()
		self.fetcher = NetworkDataFetcher(networking: networking)
		
		setupNavigationBar()
		setupTableView()
		
		firstGetNews()
	}
	
	// MARK: - Private funcs
	
	@objc private func didSwipeRefreshGroups() {
		
		getNews()
		refreshControl.endRefreshing()
	}
	
	private func setupTableView() {
		
		tableView.register(R.nib.newsTableViewCell)
		tableView.refreshControl = refreshControl
		tableView.rowHeight = UITableView.automaticDimension
	}
	
	private func setupNavigationBar() {
		
		self.title = R.string.constans.titleNewsFeed()
		
		navigationController?.navigationBar.prefersLargeTitles = false
		
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = R.string.constans.searchBarPlaceholder()
		
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
	}
	
	//MARK: - Network
	
	private func firstGetNews() {
		
		tableView.isHidden = true
		activityIndicator.startAnimating()
		
		getNews()
	}
	
	private func getNews() {
		
		fetcher.getNews { [weak self] newsResponse, error in
			
			if let error = error {
				self?.showAlert(alertText: error.localizedDescription, alertMessage: "")
				return
			}
			
			guard let newsResponse = newsResponse else { return }
			
			self?.newsFeed = newsResponse
			
			let articlesList = newsResponse.articles?.map {
				NewsFeedViewModel.Cell(imageUrlString: $0.urlToImage ?? "",
									   title: $0.title ?? "",
									   description: $0.description ?? "")
				} ?? []
			
			self?.newsFeedViewModel.cells = articlesList
			
			self?.activityIndicator.stopAnimating()
			self?.activityIndicator.isHidden = true
			
			self?.tableView.isHidden = false
			self?.tableView.reloadData()
		}
	}
	
	//MARK: - Navigation
	
	func showDetail(with article: Article) {
		
		guard let detailViewController = R.storyboard.main.detailViewController() else { return }
		detailViewController.article = article
		
		self.show(detailViewController)
	}
}

//MARK: - UITableViewDataSource

extension NewsFeedViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if isFiltering {
			return filteredNewsFeedViewModel.cells.count
		}
		
		return newsFeedViewModel.cells.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.newsTableViewCell, for: indexPath)!
		
		let cellViewModel: NewsFeedViewModel.Cell
		
		if isFiltering {
			cellViewModel = filteredNewsFeedViewModel.cells[indexPath.row]
		} else {
			cellViewModel = newsFeedViewModel.cells[indexPath.row]
		}
		
		cell.set(viewModel: cellViewModel)
		
		return cell
	}
}

//MARK: - UITableViewDelegate

extension NewsFeedViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let cellViewModel: NewsFeedViewModel.Cell
		
		if isFiltering {
			cellViewModel = filteredNewsFeedViewModel.cells[indexPath.row]
		} else {
			cellViewModel = newsFeedViewModel.cells[indexPath.row]
		}
		
		guard let article = newsFeed?.articles?.first(where: { $0.title == cellViewModel.title })  else { return }
		
		showDetail(with: article)
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return UITableView.automaticDimension
	}
}

//MARK: - UISearchResultsUpdating

extension NewsFeedViewController: UISearchResultsUpdating {
	
	func updateSearchResults(for searchController: UISearchController) {
		
		self.filteredNewsFeedViewModel.cells.removeAll(keepingCapacity: false)
		
		guard let searchText = searchController.searchBar.text else { return }
		
		let array = newsFeedViewModel.cells.filter {
			return $0.title.range(of: searchText) != nil ||
				$0.description?.range(of: searchText) != nil
		}
		
		self.filteredNewsFeedViewModel.cells = array
		
		self.tableView.reloadData()
	}
}

//
//  JobListViewModel.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import Foundation

class JobListViewModel: ObservableObject {
	@Published var jobList: [JobModel] = []
	@Published var appliedList: [JobModel] = []
	
	let APIurl = "https://test-server-klob.onrender.com/fakeJob/apple/academy"

	func fetchJobData(completion: @escaping (Result<[JobModel], Error>) -> Void) {
		
		guard let url = URL(string: APIurl) else {
			completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error {
				print("Error to fetch")
				completion(.failure(error))
				return
			}
			
			guard let data = data else {
				completion(.failure(NSError(domain: "No data", code: -2, userInfo: nil)))
				return
			}
			
			do {
				let decoder = JSONDecoder()
//				decoder.keyDecodingStrategy = .convertFromSnakeCase
				let jobListDecoded = try decoder.decode([JobModel].self, from: data)
				self.jobList = jobListDecoded
				completion(.success(jobListDecoded))
			} catch {
				print("Error to decode")
				completion(.failure(error))
			}
		}.resume()
	}



}

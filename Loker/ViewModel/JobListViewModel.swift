//
//  JobListViewModel.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import Foundation

class JobListViewModel: ObservableObject {
	@Published var jobList: [JobResponseModel] = []
	@Published var appliedList: [JobResponseModel] = []
	
	let APIurl = "https://test-server-klob.onrender.com/fakeJob/apple/academy"
	var isLoading: Bool = false
	
	func fetchJobData() async {
		self.isLoading = true
		guard let url = URL(string: APIurl) else {
			print("Invalid URL")
			return
		}
		
		do {
			let (data, response) = try await URLSession.shared.data(from: url)
			
			guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
				print("Error: \(response)")
				return
			}
			
			let jobListDecoded = try JSONDecoder().decode([JobResponseModel].self, from: data)
			await MainActor.run {
				self.jobList = jobListDecoded
				self.isLoading = false
			}
			print(jobListDecoded)

		} catch {
			print("error to decode")
			DispatchQueue.main.async {
				self.isLoading = false
			}
			return
			
		}
	}
	
}

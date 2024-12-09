import SwiftUI

struct HomeView: View {
	@StateObject var JobVM = JobListViewModel()
	var body: some View {
		ZStack(alignment: .top) {
			NavigationTopView()
		}
		.frame(height: 50)
		.shadow(radius: 5)
		
		List {
			Text("Lowongan Pekerjaan")
				.listRowBackground(Color.clear)
				.listRowSeparator(.hidden)
				.offset(x: -15)
				.foregroundStyle(.accent)
				.font(.headline)
			JobList()
		}
		.listStyle(InsetGroupedListStyle())
		.onAppear {
			fetchData()
		}
	}
	
	private func fetchData() {
		JobVM.fetchJobData() { result in
			switch result {
			case .success(let jobList):
				print("Successfully fetched \(jobList.count) jobs:")
				jobList.forEach { print($0) }
			case .failure(let error):
				print("Failed to fetch jobs with error: \(error.localizedDescription)")
			}
		}
	}
}

#Preview {
	HomeView()
}

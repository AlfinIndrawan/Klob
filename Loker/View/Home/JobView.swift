import SwiftUI

struct JobView: View {
	@StateObject var JobVM = JobListViewModel()
	
	var body: some View {
		List {
			Text("Lowongan Pekerjaan")
				.listRowBackground(Color.clear)
				.listRowSeparator(.hidden)
				.offset(x: -15)
				.foregroundStyle(.accent)
				.font(.headline)
			
			JobList()
				.environmentObject(JobVM)
				.listRowSeparator(.hidden)

		}
		.listStyle(.insetGrouped)
		.onAppear {
			fetchData()
		}
	}
	
	private func fetchData() {
		Task {
			await JobVM.fetchJobData()
		}
	}
}

#Preview {
	JobView()
}

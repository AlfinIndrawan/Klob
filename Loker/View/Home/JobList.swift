//
//  JobList.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import SwiftUI

struct JobList: View {
	@EnvironmentObject var JobListVM: JobListViewModel
	
	var body: some View {
		ForEach(JobListVM.jobList, id: \.jobVacancyCode) { job in
			HStack(alignment: .top) {
				AsyncImage(url: URL(string: job.corporateLogo)) { image in
					image.image?
						.resizable()
						.frame(width: 50, height: 50)
						.aspectRatio(contentMode: .fill)
				}
				
				// Content section
				VStack(alignment: .leading, spacing: 5) {
					// Title and subtitle
					Text("\(job.positionName)")
						.font(.headline)
						.foregroundColor(.accentColor)
						.bold()
					Text("\(job.corporateName)")
						.font(.subheadline)
						.bold()
						.foregroundColor(.accentColor)
					
					// Employment type and salary
					HStack {
						Text("\(job.status)")
							.font(.caption)
							.foregroundColor(.accentColor)
						Spacer()
						if job.salaryFrom != 0 {
							Text("IDR \(job.salaryFrom) - \(job.salaryTo)")
								.font(.caption)
								.foregroundColor(.blue)
								.padding(.vertical, 5)
								.padding(.horizontal, 10)
								.background(RoundedRectangle(cornerRadius: 8).fill(Color.blue.opacity(0.1)))
						}
					}
					.padding(.bottom, 10)
					
					// Date and button
					HStack {
						Text("\(job.postedDate ?? "-")")
							.font(.caption)
							.foregroundColor(.accentColor)
						Spacer()
						Button {
							print("Apply button tapped")
							JobListVM.applyJob(data: job)
						} label: {
							Text("LAMAR")
								.font(.caption)
								.foregroundColor(.white)
								.padding(.vertical, 10)
								.padding(.horizontal, 20)
								.background(RoundedRectangle(cornerRadius: 15).fill(Color("Button")))
						}
						.buttonStyle(.borderless)
					
					}
					
				}
			}
			.padding(.vertical, 10)
			.listRowBackground(
				RoundedRectangle(cornerRadius: 5)
					.background(.clear)
					.foregroundColor(.white)
					.padding(
						EdgeInsets(
							top: 5,
							leading: 10,
							bottom: 5,
							trailing: 10
						)
					)
			) // list row background
		} // for each
	}
}

#Preview {
	JobList()
}

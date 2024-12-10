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
					Text("DB Master Staff")
						.font(.headline)
						.foregroundColor(.accentColor)
						.bold()
					Text("Bank Mandiri")
						.font(.subheadline)
						.bold()
						.foregroundColor(.accentColor)
					
					// Employment type and salary
					HStack {
						Text("Karyawan Tetap")
							.font(.caption)
							.foregroundColor(.accentColor)
						Spacer()
						Text("IDR 1.000.000 - 5.000.000")
							.font(.caption)
							.foregroundColor(.blue)
							.padding(.vertical, 5)
							.padding(.horizontal, 10)
							.background(RoundedRectangle(cornerRadius: 8).fill(Color.blue.opacity(0.1)))
					}
					.padding(.bottom, 10)
					
					// Date and button
					HStack {
						Text("19 days ago")
							.font(.caption)
							.foregroundColor(.accentColor)
						Spacer()
						Button(action: {
							print("Apply button tapped")
						}) {
							Text("LAMAR")
								.font(.caption)
								.foregroundColor(.white)
								.padding(.vertical, 10)
								.padding(.horizontal, 20)
								.background(RoundedRectangle(cornerRadius: 15).fill(Color("Button")))
						}
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

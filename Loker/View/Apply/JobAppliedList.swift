//
//  LamaranTerkirim.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import SwiftUI

struct JobAppliedList: View {
	@EnvironmentObject var jobVM: JobListViewModel
	
		var body: some View {
				List {
					Text("Lamaran Terkirim")
						.listRowBackground(Color.clear)
						.listRowSeparator(.hidden)
						.offset(x: -15)
						.foregroundStyle(.accent)
						.font(.headline)
					
					ForEach(jobVM.appliedList, id: \.jobVacancyCode) { job in
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
									Text("Karyawan Tetap")
										.font(.caption)
										.foregroundColor(.accentColor)
									Spacer()
									Text("\(job.salaryFrom) - \(job.salaryTo)")
										.font(.caption)
										.foregroundColor(.blue)
										.padding(.vertical, 5)
										.padding(.horizontal, 10)
										.background(RoundedRectangle(cornerRadius: 8).fill(Color.blue.opacity(0.1)))
								}
								.padding(.bottom, 10)
								
								// Date and button
								HStack {
									Text("19 ")
										.font(.caption)
										.foregroundColor(.accentColor)
									Spacer()
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
				} // list
				.listStyle(.insetGrouped)
		}
}

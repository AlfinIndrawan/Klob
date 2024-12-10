//
//  NavigationTopView.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import SwiftUI

struct NavigationTopView: View {
	@Binding var selection: Int
	
	var body: some View {
		ZStack(alignment: .top) {
				HStack {
					Image(systemName: "house")
						.resizable()
						.frame(width: 24, height: 24)

					Spacer()
					
					Button(action: {
						selection = 0 // Navigate to Home
					}) {
							Text("Lowongan Kerja |")
								.font(.caption)
					}
					.foregroundColor(selection == 0 ? .blue : .gray)
					
					
					Button(action: {
						selection = 1 // Navigate to Job List
					}) {
							Text("Lowongan Terkirim")
								.font(.caption)
					}
					.foregroundColor(selection == 1 ? .blue : .gray)
					.contentMargins(20)
					
				}
				.padding()
		} // zstack
		.frame(height: 50)
	}
}

struct TabContentView: View {
	@Binding var selection: Int // Binding to track the selected tab
	@StateObject var jobVM = JobListViewModel()
	
	var body: some View {
		Group {
			switch selection {
			case 0:
				// First Tab: Home
				JobView()
					.environmentObject(jobVM)
			case 1:
				// Second Tab: Job List
				JobAppliedList() // Add your list view here
					.environmentObject(jobVM)
			default:
				Text("Error: Tab Not Found")
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure it takes full screen
		.background(Color.gray.opacity(0.1)) // Add background for better contrast
	}
}

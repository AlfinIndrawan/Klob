//
//  NavigationTopView.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import SwiftUI

struct NavigationTopView: View {
	var body: some View {
		NavigationStack {
			HStack {
				Image(systemName: "house")
					.resizable()
					.frame(width: 24, height: 24)
				Spacer()
				NavigationLink(destination: HomeView()) {
					Text("Lowongan Kerja |")
				}
				
				NavigationLink(destination: JobAppliedList()) {
					Text("Lowongan Terkirim")
				}
			}
			.padding()
		}
	}
}

#Preview {
	NavigationTopView()
}

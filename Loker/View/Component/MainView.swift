//
//  TabView.swift
//  Loker
//
//  Created by Alfin Indrawan on 10/12/24.
//

import SwiftUI

struct MainView: View {
	var body: some View {
			TabView {
				JobView()
					.tabItem {
						Label("", systemImage: "house")
					}

					Image(systemName: "house")
						.resizable()
						.frame(width: 24, height: 24)
				
					JobView()
						.tabItem { Text("Lowongan Kerja |").bold() }
					
					JobAppliedList()
						.tabItem { Text("Lowongan Terkirim").bold() }

				.padding()
			}
			.onAppear {
				let appearance = UITabBarAppearance()

				// Customize the normal and selected states
				appearance.stackedLayoutAppearance.normal.iconColor = .gray
				appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
					NSAttributedString.Key.foregroundColor: UIColor.gray
				]

				appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color.accentColor)
				appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
					NSAttributedString.Key.foregroundColor: UIColor(Color.accentColor)
				]

				UITabBar.appearance().standardAppearance = appearance
				if #available(iOS 15.0, *) {
					UITabBar.appearance().scrollEdgeAppearance = appearance
				}
			}  // onappear
	}
}

#Preview {
	MainView()
}

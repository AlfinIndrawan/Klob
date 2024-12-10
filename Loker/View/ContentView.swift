//
//  ContentView.swift
//  Loker
//
//  Created by Alfin Indrawan on 10/12/24.
//

import SwiftUI

struct ContentView: View {
	@State private var selectedView = 0 // Track the selected tab
	
	var body: some View {
		NavigationTopView(selection: $selectedView)
		// Content Based on Tab Selection
		TabContentView(selection: $selectedView)
	}
}

#Preview {
	ContentView()
}

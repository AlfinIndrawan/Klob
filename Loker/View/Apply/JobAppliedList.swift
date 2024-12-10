//
//  LamaranTerkirim.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import SwiftUI

struct JobAppliedList: View {
		var body: some View {
			List {
				Text("Lamaran Terkirim")
					.listRowBackground(Color.clear)
					.listRowSeparator(.hidden)
					.offset(x: -15)
					.foregroundStyle(.accent)
					.font(.headline)
			}
		}
}

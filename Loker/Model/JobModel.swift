//
//  JobModel.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import Foundation

struct JobModel: Codable, Hashable {
	let positionName: String
	let corporateName: String
	let status: String
	let corporateLogo: String
	let applied: Bool?
	let salaryFrom, salaryTo: Int
	let postedDate: String?
}

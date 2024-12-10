//
//  JobModel.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import Foundation

struct JobResponseModel: Decodable {
	let jobVacancyCode: String
	let positionName: String
	let corporateId: String
	let corporateName: String
	let status: String
	let descriptions: String
	let corporateLogo: String
	let applied: Bool?
	let salaryFrom, salaryTo: Int
	let postedDate: String?
}

//
//  JobModel.swift
//  Loker
//
//  Created by Alfin Indrawan on 09/12/24.
//

import Foundation

// MARK: - WelcomeElement
struct JobModel: Codable {
	let jobVacancyCode: String
	let positionName: String
	let corporateID: String
	let corporateName: String
	let status, descriptions: String
	let corporateLogo: String
	let applied: Bool?
	let salaryFrom, salaryTo: Int
	let postedDate: String
	
	enum CodingKeys: String, CodingKey {
		case jobVacancyCode, positionName
		case corporateID = "corporateId"
		case corporateName, status, descriptions, corporateLogo, applied, salaryFrom, salaryTo, postedDate
	}
}

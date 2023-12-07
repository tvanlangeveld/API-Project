//
//  DMError.swift
//  DMNetworkingIntro
//
//  Created by Tanner Vanlangeveld on 12/6/23.
//
import Foundation

enum DMError: String, Error {
    case invalidURL = "There was an issue connecting to the server."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}


//
// 
// FileName: ImageAsset.swift
// ProjectName: Quiz App
//
// Created by MD ABIR HOSSAIN on 11/8/24 at 12:58 AM
// Website: https://mdabirhossain.com/
//


import Foundation

enum ImageAsset: String {
    case warningShield = "warning_shield"
    case warningBack = "warning_back"
    case warningSuccess = "warning_success"
}

enum AlertWarning: String {
    case warningShield = "Are you sure you want to start \nyour quiz?"
    case warningBack = "Are you sure you want to exit \nyour quiz?"
    case warningSuccess = "Congratulations"
    case description = "Congratulations "
}

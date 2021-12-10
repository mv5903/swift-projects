//
//  Database.swift
//  Batterama
//
//  Created by Matthew Vandenberg on 11/22/21.
//
import Foundation
import CryptoKit
import SwiftUI

struct Database {
    @AppStorage("email") var email: String = "";
    
    public static func createUser(firstname: String, lastname: String, email: String, password: String) -> Void {
        let encPassword = hash(item: password);
        let devices = "[]";
        
    }
    
    public static func logIn(email: String, password: String) -> Void {
        
    }
    
    public static func getDeviceData(email: String) -> String {
        
        return "";
    }
    
    public static func doesUserExist(email: String) -> Bool {
        return false;
    }
    
    public static func hash(item: String) -> String {
        let data = Data(item.utf8);
        let item = SHA512.hash(data: data);
        let text = item.compactMap { String(format: "%02x", $0) }.joined();
        return text;
    }
}

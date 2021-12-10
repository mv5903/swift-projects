//
//  FirstLaunch.swift
//  Batterama
//
//  Created by Matthew Vandenberg on 11/22/21.
//

import Foundation
import SwiftUI

struct FirstLaunch: View {
    @AppStorage("email") var email: String = "";
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false;
    @State var isCreatingAccount: Bool = false;
    @State var password: String = "";
    @State var firstname: String = "";
    @State var lastname: String = "";
    var body: some View {
        VStack {
            Text("Welcome To Batterama!")
            Text("Sign up or create an account to get started!")
            Form {
                if (isCreatingAccount) {
                    Section(header: Text("First Name")) {
                        TextField("First Name", text: $firstname)
                    }
                    Section(header: Text("Last Name")) {
                        TextField("Last Name", text: $lastname)
                    }
                }
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                }
                Section(header: Text("Password"), footer: Text("Forgot Password?")) {
                    TextField("Password", text: $password)
                }
                Section {
                    Button(isCreatingAccount ? "Create Account" : Database.hash(item: "Hello")) {
                        if (isCreatingAccount) {
                            //Database.doesUserExist(email: email);
                            //Database.createUser(firstname: firstname, lastname: lastname, email: email, password: password);
                            //if (Database.logIn(email: email, password: password)) {
                                isLoggedIn = true;
                                MainMenu()
                            //}
                        } else {
                            //if (Database.logIn(email: email, password: password)) {
                                isLoggedIn = true;
                                MainMenu()
                            //}
                        }
                    }
                }
                Section {
                    Button(isCreatingAccount ? "Have an account? Log in." : "Don't have an account? Sign up!") {
                        isCreatingAccount = !isCreatingAccount;
                    }
                }
            }
        }
    }
}

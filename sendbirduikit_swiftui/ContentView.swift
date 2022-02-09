//
//  ContentView.swift
//  sendbirduikit_swiftui
//
//  Created by jasonkoo on 4/15/21.
//

import SwiftUI
import SendBirdUIKit

struct ContentView: View {
    init() {
        
        // Initialize the SendbirdSDK with your application id,
        // also found in the Sendbird dashboard
        SBUMain.initialize(applicationId:"0A184480-6CE6-42F8-A9CC-3BAE07B31F36")
        
        // After your user has authenticated, use a string
        // identifier unique to that user to pass to Sendbird.
        SBUGlobals.CurrentUser = SBUUser(userId: "12345678")

        // Connect with Sendbird now that the CurrentUser is set
        SBUMain.connect { (user, error) in
            
            // user object will be an instance of SBDUser
            guard let _ = user else {
                print("ContentView: init: connect: ERROR: \(String(describing: error))")
                return
            }
        }
    }
    
    var body: some View {
        ChannelListViewContainer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

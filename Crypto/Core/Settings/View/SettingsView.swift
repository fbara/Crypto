//
//  SettingsView.swift
//  Crypto
//
//  Created by Frank Bara on 10/30/21.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://startpage.com")!
    let youtubeURL = URL(string: "https://youtube.com")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let githuURL = URL(string: "https://www.github.com")!
    
    
    var body: some View {
        
        NavigationView {
            List {
                swiftfulSection
                coingeckoSection
                baralabsSection
                applicationSection
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "xmark")
                        .font(.headline)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var swiftfulSection: some View {
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Show any text here for the description.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on youtube 🎉", destination: youtubeURL)
            Link("Support coffee addiction ☕️", destination: coffeeURL)

        }
    }
    
    private var coingeckoSection: some View {
        Section(header: Text("Coin Gecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Show any text here for the description.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit Coin Gecko 🦎", destination: coingeckoURL)

        }
    }
    
    private var baralabsSection: some View {
        Section(header: Text("Baralabs")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Show any text here for the description.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit BaraLabs Github Page", destination: githuURL)

        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Developer")) {
            Link("Terms of Service", destination: githuURL)
            Link("Privacy Policy", destination: githuURL)
            Link("BaraLabs", destination: githuURL)
            Link("Learn More", destination: githuURL)

        }
    }
}

//
//  ServerListView.swift
//  DeltaCore
//
//  Created by Rohan van Klinken on 11/12/20.
//

import SwiftUI

struct ServerListView: View {
  @EnvironmentObject var configManager: ConfigManager
  @EnvironmentObject var viewState: ViewState<AppViewState>
  
  var body: some View {
    let serverList = configManager.getServerList()
    NavigationView {
      List {
        let pingers = serverList.pingers
        if !pingers.isEmpty {
          ForEach(pingers, id: \.self) { pinger in
            NavigationLink(
              destination: ServerDetailView(
                viewState: viewState,
                pinger: pinger
              )
            ) {
              ServerListEntryView(pinger: pinger)
            }
          }
        } else {
          Text("no servers")
            .italic()
        }
      }
      .listStyle(SidebarListStyle())
    }
    .navigationViewStyle(DoubleColumnNavigationViewStyle())
    .navigationTitle("Server List")
    .toolbar(content: {
      Button("edit") {
        viewState.update(to: .editServerList)
      }
      Button("add") {
        viewState.update(to: .addServer)
      }
      Button("refresh") {
        serverList.refresh()
      }
      Button(action: {
        viewState.update(to: .accountSettings)
      }, label: {
        Image(systemName: "person.crop.circle")
      })
    })
  }
}